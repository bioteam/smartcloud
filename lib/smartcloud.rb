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
  
  def initialize(u, p)
    @resource = Resource.new URI.join(BASE_URI, VERSION), :user => u, :password => p, :headers => { :accept => :json}
  end
  
  def resource
    @resource 
  end
  
  # Connect to the SCE platform
  def config(username, password, headers)
    @resource = Resource.new(URI.join(BASE_URI, VERSION), :user => username, :password => password, :headers => headers)
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
  
  # Return the list of instances that the user can manage.
  def instances
    instances = []
    JSON.parse(resource['/instances'].get)["instances"].each do |i|
      instances << Instance.new(i)
    end
    return instances
  end
  
  def create_instance(options = {})
    # Default params could go here
    params = {}.merge(options)
    resource['/instances'].post params
  end
  
  def delete_instance(id)
    instance_id = id.to_i
    resource["/instances/#{instance_id}"].delete
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
      keys << Key.new(k)
    end
    return keys
  end
  
  # Return the list of instances created with the specified $REQUEST_ID.
  def list_instances(request_id)
    instances = []
    JSON.parse(resource["/requests/#{request_id}"].get)["instances"].each do |i|
      instances << Instance.new(i)
    end
  end
  
  def default_keypair
    keys.select!{|k| k.default? }
  end
  
  def running_instances
    instances.select!{|i| i.running? }
  end
  
  def log
    logger
  end

end
