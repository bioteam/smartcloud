require "rest_client"

class SmartCloud
  include RestClient
  
  VERSION = '20100331'
  BASE_URI = "https://www-147.ibm.com/computecloud/enterprise/api/rest/"

  def initialize(u, p)
    uri = URI.join BASE_URI, VERSION
    @resource = Resource.new uri, :user => u, :password => p, :headers => { :accept => :json, :timeout => 10 }
  end

  def images(image_id = '')
    if image_id
      @resource["/offerings/image/#{image_id}"].get
    else
      @resource['/offerings/image/'].get
    end
  end

  def instances(instance_id = '')
    if instance_id
      @resource["/instances/#{instance_id}"].get
    else
      @resource['/instances'].get
    end
  end

  def storage(storage_id = '')
    if storage_id
      @resource["/storage/#{storage_id}"].get
    else
      @resource["/storage"].get
    end
  end

  def requests(request_id = '')
    if request_id
      @resource["/resquests/#{request_id}"].get
    else
      raise "No REQUEST_ID provided"
    end
  end

  def keys(key_id = '')
    if key_id
      @resource["/keys/#{key_id}"].get
    else
      @resource["/keys"].get
    end
  end

end