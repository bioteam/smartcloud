require "rest_client"
require "json"
require "logger"

class SmartCloud
  include RestClient
  
  VERSION = '20100331'
  BASE_URI = "https://www-147.ibm.com/computecloud/enterprise/api/rest/"
  
  @@last_reponse = ""
  
  def initialize(u, p, logger=Logger.new('restclient.log'))
    uri = URI.join BASE_URI, VERSION
    RestClient.log = logger
    @resource = Resource.new uri, :user => u, :password => p, :headers => { :accept => :json, :timeout => 10 }
  end

# GET <base_URL>/offerings/image
# Return the list of image offerings available to be provisioned
  def images(image_id = '')
    if image_id
      response = @resource["/offerings/image/#{image_id}"].get
    else
      response = @resource['/offerings/image/'].get
    end
    @@last_reponse = response
    images = JSON.parse(response.body)["images"]
  end

  def instances(instance_id = '')
    if instance_id
      response = @resource["/instances/#{instance_id}"].get
    else
      response = @resource['/instances'].get
    end
    @@last_reponse = response
    instances = JSON.parse(response.body)["instances"]
  end

  def storage(storage_id = '')
    if storage_id
      response = @resource["/storage/#{storage_id}"].get
    else
      response = @resource["/storage"].get
    end
    @@last_reponse = response
    storage = JSON.parse(response.body)["storage"]
  end

  def requests(request_id)
    if request_id
      response = @resource["/requests/#{request_id}"].get
    else
      raise "No REQUEST_ID provided"
    end
    @@last_reponse = response
    requests = JSON.parse(response.body)["requests"]
  end

  def keys(key_id = '')
    if key_id
      response = @resource["/keys/#{key_id}"].get
    else
      response = @resource["/keys"].get
    end
    # p response
    @@last_response = response
    keys = JSON.parse(response.body)["keys"]
  end
  
  def resource
    @resource
  end
  
  def last_response
    @@last_response
  end

end
