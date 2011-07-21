#
# This class describes a SmartCloud keypair
#
require "hashie/mash"

class Key < Hashie::Mash
  
  def default?
    self['default']
  end
  
end