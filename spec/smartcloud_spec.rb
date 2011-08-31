require File.dirname(__FILE__) + '/spec_helper'
require "pp"

describe "smartcloud" do
  
  before :all do
    @cloud = SmartCloud.new(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])
  end
  
  after :all do
    @cloud = nil
  end
  
  it "should be a SmartCloud" do
    @cloud.class.should == SmartCloud
  end
  it "should have keypairs" do
    @cloud.keys.size.should > 0
  end

  it "should have images" do
    # pp @cloud.images
    @cloud.images.size.should > 0
  end
  
  it "should have instances" do
    @cloud.instances.size.should > 0
  end
  
  # TODO: Mock this so the specs don't cost $$
  # it "should create an instance" do
  #   
  #   params = {
  #     :name => 'smartcloud-test',
  #     :imageID => '20026860',
  #     :instanceType => 'COP64.2/4096/60',
  #     :location => "121",
  #     :publicKey => 'sce-development',
  #     # :ip => nil,
  #     # :VolumeID => nil,
  #     # :ConfigurationData => nil,
  #     # :vlanID => nil,
  #     # :SecondaryIP => nil,
  #     # :antiCollocationInstance => nil,
  #     :isMiniEphemeral => 'false'
  #   }
  #   
  #   response = @cloud.create_instance(params)
  #   pp response
  #   response.should_not == nil
  # end
  # 
end