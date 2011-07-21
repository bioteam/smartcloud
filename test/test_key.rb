$: << File.join(File.dirname(__FILE__), '..', 'lib') # include the lib dir
require "test/unit"
require "smartcloud"
require "smartcloud/key"
require "pp"

class TestSmartCloudKey < Test::Unit::TestCase
  def test_canhazkeyname
    keys = JSON.parse(File.read('keys-response.json'))["keys"].map{|k| Key.new(k) }
    assert_equal("DEFAULT", keys.first.keyName)
  end
  
  def test_canhasmethodz
     keys = JSON.parse(File.read('keys-response.json'))["keys"].map{|k| Key.new(k) }
     assert_equal(true, keys.first.default?)
  end
end