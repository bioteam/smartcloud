require "rest_client"
require "json"
require "logger"

class SmartCloud
  include RestClient
  
  attr_reader :instances, :volumes, :images, :addresses, :keypairs, :locations
  
  VERSION = '20100331'
  BASE_URI = "https://www-147.ibm.com/computecloud/enterprise/api/rest/"
  
  @@last_reponse = ""
  
  def initialize(u, p, logger=Logger.new('restclient.log'))
    
    uri = URI.join BASE_URI, VERSION
    RestClient.log = logger
    
    @resource = Resource.new uri, :user => u, :password => p, :headers => { :accept => :json}
    
    @instances = @resource['/instances']
    @volumes = @resource['/volumes']
    @images = @resource['/images']
    @addresses = @resource['/addresses']
    @keypairs = @resource['/keys']
    @locations = @resource['/locations']
    
  end

# GET <base_URL>/offerings/image
# Return the list of image offerings available to be provisioned
  def describe_images
    images.get
  end
  
  def describe_instances
    instances.get
  end

  def describe_volumes
    storage.get
  end
  
  def describe_keypairs
    keypairs.get
  end
  
  def create_instance(options = {})
    params = {
      :name => 'test',
      :imageID => '20025347',
      :instanceType => 'large',
      :publicKey => 'kraut-igm-gsg2',
      :isMiniEphemeral => 'true'
    }.merge!(options)
    
    instances.post params
  end

end
