SmartCloud
==========

A ruby interface to IBM SmartCloud Enterprise.

See: https://www.ibm.com/cloud/enterprise

Gem Dependencies
================

* json
* rest-client
* hashie

Installation
============

`gem install smartcloud`

Usage
=====

Some useful commands are included

```bash
$ ic-instances
fs01        	123840	170.225.188.137 Active         	
node_2  	124558	170.225.189.162 Active         	
node_3  	124560	170.225.189.163 Active

$ ic-kill-instances
Shutdown fs01? [y/n] n
Shutdown node_2? [y/n] n
Shutdown node_3? [y/n] n

$ ic-get-hostlist
170.225.188.137 vhost0137.jp.ap.compute.ihost.com fs01
170.225.189.162 vhost0417.jp.ap.compute.ihost.com node_2
170.225.189.163 vhost0418.jp.ap.compute.ihost.com node_3
```

List available images

```ruby
cloud = SmartCloud.new(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])
images = cloud.images
```

Create a server

```ruby
cloud = SmartCloud.new(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])

response = cloud.create_instance({
  :name => 'smartcloud-test',
  :imageID => '20026860',
  :instanceType => 'COP64.2/4096/60',
  :location => "121",
  :publicKey => 'ucb-development',
  :ip => nil,
  :VolumeID => nil,
  :ConfigurationData => nil,
  :vlanID => nil,
  :SecondaryIP => nil,
  :antiCollocationInstance => nil,
  :isMiniEphemeral => 'false'
})
```

All of the objects are really just a Mash, so you can work with attributes in several ways

```ruby
instance = cloud.instances.first
instance.name # => 'smartcloud-test'
instance['name'] => 'smartcloud-test'
instance[:name] => 'smartcloud-test'
```
