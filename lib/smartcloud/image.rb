class Image
  attr_accessor :resource
  def initialize
  end 
  
  def resource
    @resource = Resource.new
  end
end