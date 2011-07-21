#
# This class describes a SmartCloud keypair
#
require "hashie/mash"

class Instance < Hashie::Mash
  
  # In the returned result of GET service, you can see the instance status code. The meaning for each code is:
  # 0 New 
  # 1 Provisioning 
  # 2  Failed 
  # 3  Removed 
  # 4 Rejected
  # 5  Active 
  # 6  Unknown 
  # 7 Deprovisioning 
  # 8  Restarting 
  # 9  Starting 
  # 10 Stopping 
  # 11 Stopped 
  # 12  Deprovisioning pending
  # 13 Restart pending 
  # 14 Attaching 
  # 15  Detaching
  
  def human_readable_status
    case self.code
    when 0
      "New"
    when 1
      "Provisioning"
    when 2
      "Failed"
    when 3
      "Removed"
    when 4
      "Rejected"
    when 5
      "Active"
    when 6
      "Unknown"
    when 7
      "Deprovisioning"
    when 8
      "Restarting"
    when 9
      "Starting"
    when 10
      "Stopping"
    when 11
      "Stopped"
    when 12
      "Deprovisioning pending"
    when 13
      "Restart pending"
    when 14
      "Attaching"
    when 15
      "Detaching"
    end
  end
  
end