require File.dirname(File.expand_path(__FILE__)) + '/../helper.rb'

class TestApiKeyScrapers < Minitest::Test
  context "base api scraper class" do
    setup do
      @scraper = AdtekioAdnetworks::ApiKeyScrapers.new
    end

    should "send the right method" do
      mock(@scraper).key_for_banana { "apple" }
      assert_equal "apple", @scraper.obtain_key_for("banana", {})
    end

    should "have working get_and_match that returns match contents" do
      mock(@scraper)._g("url") { os(:content => "match this") }

      assert_equal "this", @scraper.send(:get_and_match, "url", /match (.+)/)
    end

    should "return nil if no match when using get_and_match" do
      mock(@scraper)._g("url") { os(:content => "dontmatch! this") }

      assert_nil @scraper.send(:get_and_match, "url", /match (.+)/)
    end

    should "have a working post_and_match" do
      mock(@scraper)._p("url",{}) { os(:content => "match this") }

      assert_equal("this",
                   @scraper.send(:post_and_match, "url", {}, /match (.+)/))
    end

    should "not match and return nil when using post_and_match" do
      mock(@scraper)._p("url",{}) { os(:content => "dontmatch! this") }

      assert_nil @scraper.send(:post_and_match, "url", {}, /match (.+)/)
    end

    should "have working enter_login_details" do
      { "work" =>
        [ os({ :name => "email",    :value => nil}),
          os({ :name => "password", :value => nil})],
        "case insensitive" =>
        [ os({ :name => "EmAiL",    :value => nil}),
          os({ :name => "PassWord", :value => nil})],
        "password can be written passwd" =>
        [ os({ :name => "EmAiL",    :value => nil}),
          os({ :name => "PassWd",   :value => nil})]
      }.each do |test_name, fields|
        msg  = "Failed for #{test_name}"
        form = OpenStruct.new(:fields => fields)

        params = { "username" => "username", "password" => "password"}
        @scraper.instance_variable_set("@params", params)

        assert_equal form, @scraper.send(:enter_login_details, form), msg
        assert_equal "username", fields.first.value, msg
        assert_equal "password", fields.last.value, msg
      end
    end
  end

  context "specific scrapers" do
    setup do
      @scraper = AdtekioAdnetworks::ApiKeyScrapers.new
    end

    should "have working unilead" do
      mock(@scraper)._g("http://my.unileadnetwork.com/") do
        os(:forms => ["fubar"])
      end
      mock(@scraper).enter_login_details('fubar') do
        os(:submit => "donothing")
      end

      mock(@scraper).
        get_and_match("http://my.unileadnetwork.com/stats/stats_api",
                      /Your API Key .+ <i>([^ ]+)[<]/) { "token" }

      assert_equal({ :token => "token"}, @scraper.obtain_key_for("unilead",{}))
    end

    should "have working vungle" do
      params = { "username" => "username", "password" => "password"}

      mock_agent = Object.new.tap do |o|
        mock(o).post("https://v.vungle.com/dashboard/login", {
                       "_csrf"    => "csrf_token",
                       "email"    => params["username"],
                       "password" => params["password"]})
      end

      @scraper.instance_variable_set("@agent", mock_agent)

      mock(@scraper).get_and_match("https://v.vungle.com/dashboard/login",
                                   /id="csrf" value="([^"]+)"/) {"csrf_token"}
      mock(@scraper).get_and_match("https://v.vungle.com/dashboard/reports",
                                   /"account":."_id":"([^"]+)"/) {"account_id"}

      mock(@scraper)._g("https://v.vungle.com/dashboard/api/1/"+
                        "accounts/account_id/users") do
        os(:content => [{ "secretKey" => "secret_key"}].to_json)
      end

      assert_equal({:token=>"secret_key"},
                   @scraper.obtain_key_for("vungle",params))
    end
  end
end
