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

  def test_describe_images
    images = @cloud.images
    assert_equal(200, @cloud.last_response.code)
  end
  
  def test_describe_image
    image = @cloud.images('20024687')
    assert_equal(200, @cloud.last_response.code)
  end
  
  def test_describe_instances
    instances = @cloud.instances
    assert_equal(200, @cloud.last_response.code)
  end
  
  def test_describe_storage
    storage = @cloud.storage
    assert_equal(200, @cloud.last_response.code)
  end
  
  def test_describe_requests
    requests = @cloud.requests(107650)
    assert_equal(200, @cloud.last_response.code)
  end
  
  def test_describe_keys
    keys = @cloud.keys
    assert_equal(200, @cloud.last_response.code)
  end

  
  def test_response_json
    keys = @cloud.keys
    keys.each do |key|
      key.each_pair do |k,v|
        # p k
      end
    end
  end

  def test_attribute
    keys = @cloud.keys
    assert_equal("kraut-ibm-gsg2", keys.first["keyName"])
  end
  
end