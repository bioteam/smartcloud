require File.dirname(__FILE__) + '/spec_helper'

describe "smartcloud" do
  
  before :all do
    @cloud = SmartCloud.new(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])
  end
  
  it "should have keypairs" do
    @cloud.keys.size.should > 0
  end
  
  after :all do
    @cloud = nil
  end
  
end