require File.dirname(File.expand_path(__FILE__)) + '/../helper.rb'
require 'ostruct'

class TestBasics < Minitest::Test
  context "generate urls" do
    should "be able to generate url templates" do
      AdtekioAdnetworks::Postbacks.networks.map do |network,klz|
        klz.postbacks.map do |platform,events|
          events.map do |event|
            klz.send(event, platform).each do |url|
              assert_kind_of(String, url,
                             "Failed for #{network}/ #{platform} / #{event}")
            end
          end
        end
      end
    end
  end
end
