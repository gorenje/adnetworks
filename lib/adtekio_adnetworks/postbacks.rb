require 'uuidtools'
require 'json'
require 'digest/sha2'
require 'digest/md5'
require 'erubis'

module AdtekioAdnetworks
  module Postbacks
    extend self

    PossibleEvents =  {
      :mac => "Attribution",
      :ist => "Application Install",
      :apo => "Application Open",
      :fun => "Tutorial",
      :pay => "Payment",
      :eor => "End of Round",
      :scs => "Scene Start",
      :scc => "Scene Complete",
    }

    def networks
      @networks ||= {}
    end

    def register(postback_klz)
      networks[postback_klz.network] = postback_klz
    end
  end

  class CGIEruby < Erubis::PI::Eruby
    REGEXP = Regexp.new("[^#{URI::PATTERN::UNRESERVED}]").freeze

    def escaped_expr(code)
      return "URI.encode((#{code.strip}).to_s, CGIEruby::REGEXP)"
    end
  end

  class BasePostbackClass
    attr_reader :event, :params, :user, :netcfg

    class MD5 < Digest::MD5
      class << self
        alias orig_new new
        def new(str = nil)
          if str
            orig_new.update(str)
          else
            orig_new
          end
        end

        def md5(*args)
          new(*args)
        end
      end
    end

    def initialize(event, user, netcfg)
      @event  = event
      @params = event.params
      @user   = user
      @netcfg = netcfg
    end

    def sha1(value)
      Digest::SHA1.hexdigest(value || "")
    end

    def muidify(val)
      Base64.encode64(MD5.md5(val).digest).tr("+/=", "-_\n").strip
    end

    def should_handle?(cfg)
      cfg.check.nil? || (if cfg.check.is_a?(Symbol)
                           send(cfg.check)
                         else
                           eval(cfg.check)
                         end)
    end

    def cfg_to_url(cfg)
      return unless should_handle?(cfg)

      @header = if cfg.header.is_a?(Hash)
                  uri = Addressable::URI.new
                  uri.query_values = cfg.header
                  CGI.unescape(uri.to_s).gsub(/^[?]/,'')
                elsif cfg.header.is_a?(Symbol)
                  send(cfg.header)
                else
                  nil
                end

      @body = if cfg.post.is_a?(Hash)
                uri = Addressable::URI.new
                uri.query_values = cfg.post
                CGI.unescape(uri.to_s)
              elsif cfg.post.is_a?(Symbol)
                send(cfg.post)
              else
                nil
              end

      urlparams = if cfg.params.is_a?(Hash)
                    cfg.params
                  elsif cfg.params.is_a?(Symbol)
                    send(cfg.params)
                  end

      uri = Addressable::URI.parse(cfg.url)
      uri.query_values = urlparams
      @url = CGI.unescape(uri.to_s)

      parsed_url = if @url =~ /@{.*}@/ || @url =~ /<%.*%>/m
                     CGIEruby.new(@url).result(binding)
                   else
                     @url
                   end

      parsed_body = if @body && (@body =~ /@{.*}@/ || @body =~ /<%.*%>/m)
                      CGIEruby.new(@body).result(binding)
                    else
                      @body
                    end

      parsed_header = if @header && (@header =~ /@{.*}@/ || @header =~ /<%.*%>/m)
                        CGI::parse(CGIEruby.new(@header).result(binding))
                      else
                        CGI::parse(@header || "")
                      end
      parsed_header.each {|key, value| parsed_header[key] = value.first }

      { :url => parsed_url, :body => parsed_body, :header => parsed_header }
    end
  end

  module BasePostbacks
    def self.included(klz)
      klz.class_eval do
        def self.postbacks
          @postbacks ||= Hash.new{ |k,v| k[v] = [] }
        end

        def self.pbcfg
          @pbcfg ||= Hash.new{ |k,v| k[v] = Hash.new{ |k,v| k[v] = [] }}
        end

        def self.define_network_config(&block)
          @network_config = yield
          self.class_eval do
            def self.netcfg
              @network_config
            end
          end
        end

        def self.define_postback_for(platform, type, &block)
          cfg = OpenStruct.new(yield)

          postbacks[platform] << type.to_sym
          pbcfg[platform][type.to_sym] << cfg

          self.send(:define_method, type, Proc.new do |platform|
                      pbc = self.class.instance_variable_get("@pbcfg")
                      pbc[platform.to_sym][type.to_sym].map do |cfg|
                        cfg_to_url(cfg)
                      end.compact
                    end)

          self.class.send(:define_method, type, Proc.new do |platform|
                            @pbcfg[platform.to_sym][type.to_sym].map do |cfg|
                              cfg_to_url(cfg)
                            end
                          end)
        end

        def self.cfg_to_url(cfg)
          if cfg.params.is_a?(Hash)
            uri = Addressable::URI.parse(cfg.url)
            uri.query_values = cfg.params
            CGI.unescape(uri.to_s)
          else
            "%s?%s" % [cfg.url, cfg.params]
          end
        end

        def self.network
          name.to_s.sub(/^.+::([^:]+)$/,'\1').snakecase.to_sym
        end
      end

      Postbacks.register(klz)
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'postbacks', '*.rb')].each do |f|
  require f
end
