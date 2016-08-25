require File.dirname(File.expand_path(__FILE__)) + '/../../helper.rb'
require 'ostruct'

module Postbacks
  class TestChartboost < Minitest::Test
    TestKlz = AdtekioAdnetworks::Postbacks::Chartboost

    def instance_with_event(event, opts = {})
      TestKlz.new(event, opts[:user] || OpenStruct.new,
                  opts[:netcfg] || OpenStruct.new,
                  opts[:params] || OpenStruct.new)
    end

    class ChartboostEvent < OpenStruct
      def android?
        !!is_android
      end
    end

    context "helper methods - install_body" do
      should "have working android? true" do
        obj = instance_with_event(ChartboostEvent.new(:is_android => true))
        assert_equal({"app_id"=>nil,"claim"=>1}, JSON.parse(obj.install_body))
      end

      should "have working android with gadid" do
        obj = instance_with_event(ChartboostEvent.new(:is_android => true,
                                                      :gadid => "gadid"))
        assert_equal({"gaid" => "gadid", "uuid" => "gadid",
                       "app_id" => nil, "claim" => 1},
                     JSON.parse(obj.install_body))
      end

      should "have working android with android_id" do
        obj = instance_with_event(ChartboostEvent.
                                  new(:is_android => true,
                                      :android_id => "android_id",
                                      :gadid => "gadid"))
        assert_equal({"gaid" => "gadid", "uuid" => "android_id",
                       "app_id" => nil, "claim" => 1},
                     JSON.parse(obj.install_body))
      end

      should "work if not android" do
        obj = instance_with_event(ChartboostEvent.new(:is_android => false))
        assert_equal({"ifa" => nil, "app_id"=>nil,"claim"=>1},
                     JSON.parse(obj.install_body))
      end

      should "set app_id if netcfg contains value" do
        obj = instance_with_event(ChartboostEvent.new(:is_android => false),
                                  :netcfg=>OpenStruct.new(:app_id=>"app_id"))
        assert_equal({"ifa" => nil, "app_id"=>"app_id","claim"=>1},
                     JSON.parse(obj.install_body))
      end
    end
  end
end
