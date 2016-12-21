#!/usr/bin/env ruby
require "network"

current = "Current IP Configuration"



puts "Starting tests. "

class Modes
    include Network
    
    def set_mode(speed, duplex)
        interface = "enp8s0"
        eth_mode(interface,speed,duplex)
    end

end

Modes.set_mode(10, full)


#show_ip()
#ethernet_half()
#get_speed()
#get_duplex()
#puts "Setting mode: \n" + get_speed() + get_duplex()

#puts current
#show_ip()

#ethernet_full()
#puts "Setting mode to 10MB/s, Full duplex"
#sleep(3)
#puts "Mode set: \n" + get_speed() + get_duplex()