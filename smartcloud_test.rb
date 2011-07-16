$: << File.dirname(__FILE__)
require "test/unit"
require "smartcloud"

class TestSmartcloud < Test::Unit::TestCase
  
  def setup
    @cloud = SmartCloud.new(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])
  end
  
  def test_should_be_a_smart_cloud
    assert_kind_of(SmartCloud, @cloud)
  end

  def test_describe_images
    assert_equal(200, @cloud.images.code)
  end
  
  def test_describe_image
    assert_equal(200, @cloud.images('20024687').code)
  end
  
  def test_describe_instances
    assert_equal(200, @cloud.instances.code)
  end
  
  def test_describe_storage
    assert_equal(200, @cloud.storage.code)
  end
  
  # def test_describe_requests
  #   assert_equal(200, @cloud.requests.code)
  # end
  
  def test_describe_keys
    assert_equal(200, @cloud.keys.code)
  end
end