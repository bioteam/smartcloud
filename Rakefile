root = File.dirname(__FILE__)
$:<< root + '/lib'

require "smartcloud"
image_id = '20025347'

desc 'start instances'
task :start do
  p "image_id: #{image_id}"
end

desc 'describe instances'
task :desc do
   @cloud = SmartCloud.new(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])
   p @cloud.describe_instances
end