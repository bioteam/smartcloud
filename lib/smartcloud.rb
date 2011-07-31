$:<< File.dirname(__FILE__) + '/lib'
require "rest_client"
require "json"
require "logger"
require "smartcloud/image"
require "smartcloud/instance"
require "smartcloud/volume"
require "smartcloud/key"

class SmartCloud
  include RestClient
  
  attr_reader :instances, :volumes, :images, :addresses, :keypairs, :locations
  
  VERSION = '20100331'
  BASE_URI = "https://www-147.ibm.com/computecloud/enterprise/api/rest/"
  
  def initialize(u, p, logger=Logger.new('restclient.log'))
    
    uri = URI.join BASE_URI, VERSION
    RestClient.log = logger
    
    @resource = Resource.new uri, :user => u, :password => p, :headers => { :accept => :json}
  end
  
  def resource
    @resource 
  end

  # GET <base_URL>/offerings/image
  # Return the list of image offerings available to be provisioned
  def images
    images = []
    JSON.parse(resource['/offerings/image'].get)["images"].each do |img|
      images << Image.new(img)
    end
    return images
  end
  
  def instances
    instances = []
    JSON.parse(resource['/instances'].get)["instances"].each do |i|
      instances << Instance.new(i)
    end
    return instances
  end

  def storage
    volumes = []
    JSON.parse(resource['/storage'].get)["volumes"].each do |v|
      volumes << Volume.new(v)
    end
    return volumes
  end
  
  def keys
    keys = []
    JSON.parse(resource['/keys'].get)["keys"].each do |k|
      keys << Key.new
    end
    return keys
  end
  
  def instances_request(request_id)
    instances = []
    JSON.parse(resource["/requests/#{request_id}"].get)["instances"].each do |i|
      instances << Instance.new(i)
    end
  end
  
  def create_instance(options = {})
    params = {
      :imageID => '20025347',
      :instanceType => 'PLT64.16/16384/60*500*500*500*500',
      :publicKey => 'ucb-development',
      :isMiniEphemeral => 'true',
      :location => "101"
    }.merge!(options)
    
    resource['/instances'].post params
  end

end