$: << File.join(File.dirname(__FILE__), '..', 'lib') # include the lib dir

require "test/unit"
require "smartcloud"
require "pp"

class TestSmartcloud < Test::Unit::TestCase

  def setup
    @cloud = SmartCloud.new(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])
  end

  def test_should_be_a_smart_cloud
    assert_kind_of(SmartCloud, @cloud)
  end

  def test_images
    images = @cloud.images
    assert_not_nil(images)
  end

  def test_instances
    instances = @cloud.instances
    assert_not_nil(instances)
  end

  def test_storage
    storage = @cloud.storage
    assert_not_nil(storage)
  end

  def test_describe_keypairs
    keys = @cloud.keys
    assert_not_nil(keys)
  end

  def test_instance_attributes
    instances = @cloud.instances
    puts
    instances.each do |i|
      puts "#{i.name} #{i.human_readable_status}"
    end
    puts
    assert_equal("ucb-master", instances.first.name)
  end
  
  def test_instances_request
    instances = @cloud.instances_request('111298')
    assert_not_nil(instances)
  end
  
  # This test actually creates a new instance!
  # def test_create_instance
  #   response = @cloud.create_instance({:name => "API-TEST"})
  #   assert_equal(200, response.code)
  # end

end