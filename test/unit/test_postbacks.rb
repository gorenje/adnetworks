require File.dirname(File.expand_path(__FILE__)) + '/../helper.rb'
require 'ostruct'

class TestPostbacks < Minitest::Test
  class TestKlz < AdtekioAdnetworks::BasePostbackClass
    include AdtekioAdnetworks::BasePostbacks

    define_network_config do
      [:appid,:source]
    end

    define_postback_for :all, :mac do
      { :url => "http://getap.ps/callback.php/@{params.fubar}@",
        :params => {
          :appid  => "@{netcfg.appid}@",
          :idfa   => "@{event.adid}@",
          :ip     => "@{event.ip}@",
          :source => "@{netcfg.source}@"
        },
        :header => {
          "x-fubar" => "@{get_header_value}@"
        }
      }
    end

    define_postback_for :all, :mac do
      { :url => "http://getap.ps/callback.php/second_url",
        :params => {
        },
        :post => {
          :fubar        => "@{get_value}@",
          :snafu        => "@{event.post_value}@",
          :symbol_value => :is_not_evaluated
        }
      }
    end

    def get_value
      event.post_value
    end

    def get_header_value
      (params && params.header && params.header[:value])
    end
  end

  context "postback defintions" do
    should "have a list of postbacks" do
      assert_equal({:all=>[:mac, :mac]}, TestKlz.postbacks)
    end

    should "have class method for returning url" do
      assert_equal(["http://getap.ps/callback.php/@{params.fubar}@"+
                    "?appid=@{netcfg.appid}@&idfa=@{event.adid}@&ip="+
                    "@{event.ip}@&source=@{netcfg.source}@",
                    "http://getap.ps/callback.php/second_url"],
                   TestKlz.mac(:all))
    end

    should "be in the list of available networks" do
      assert_equal TestKlz, AdtekioAdnetworks::Postbacks.networks[:test_klz]
    end

    should "generate a url" do
      e      = OpenStruct.new(:ip => "IP", :adid => "ADID",
                              :post_value => "POST_VALUE")
      nc     = OpenStruct.new(:appid => "APPID", :source => "SOURCE")
      user   = OpenStruct.new
      params = OpenStruct.new(:fubar => "FUBAR", :header => {:value => "VALUE"})
      r = TestKlz.new(e, user, nc, params).mac(:all)

      assert_equal("http://getap.ps/callback.php/FUBAR?appid=APPID&"+
                   "idfa=ADID&ip=IP&source=SOURCE", r.first[:url])
      assert_equal(nil, r.first[:body])
      assert_equal({"x-fubar"=>"VALUE" }, r.first[:header])

      assert_equal "http://getap.ps/callback.php/second_url", r.last[:url]
      assert_equal("fubar=POST_VALUE&snafu=POST_VALUE&"+
                   "symbol_value=is_not_evaluated", r.last[:body])
      assert_equal({}, r.last[:header])
    end
  end

  context "generate urls" do
    should "be able to generate urls using empty data" do
      event_obj = OpenStruct.new(:params => OpenStruct.new,
                                 :time => Time.now)
      user      = OpenStruct.new(:click_data => OpenStruct.new)
      netcfg    = OpenStruct.new

      for_all_events do |network, klz, platform, event|
        klz.new(event_obj,user,netcfg).send(event, platform).each do |urlcfg|
          assert_equal([:url, :body, :header], urlcfg.keys,
                       "Failed for #{network}/ #{platform} / #{event}")
        end
      end
    end

    should "be able to generate url templates" do
      for_all_events do |network, klz, platform, event|
        klz.send(event, platform).each do |url|
          assert_kind_of(String, url,
                         "Failed for #{network}/ #{platform} / #{event}")
        end
      end
    end
  end
end
