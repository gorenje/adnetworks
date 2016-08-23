require 'uuidtools'
require 'json'
require 'digest/sha2'

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

  class BasePostbackClass
    attr_reader :event, :params, :user, :netcfg

    def initialize(event, user, netcfg)
      @event  = event
      @params = event.params
      @user   = user
      @netcfg = netcfg
    end
  end

  module BasePostbacks
    def self.included(klz)
      klz.class_eval do
        def self.postbacks
          @postbacks
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
          ((@postbacks ||= { })[platform] ||= []) << type.to_sym
          self.send(:define_method, type, Proc.new do
                     _os(yield)
                   end)
        end

        def self.network
          name.to_s.sub(/^.+::([^:]+)$/,'\1').snakecase.to_sym
        end
      end

      def _os(hsh)
        OpenStruct.new(hsh)
      end

      Postbacks.register(klz)
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'postbacks', '*.rb')].each do |f|
  require f
end
