#!/usr/bin/env ruby
#require 'network'

current = "Current IP Configuration"
interface = "enp8s0"

def show_ip(interface)
    puts %x(ip a show dev #{interface} | grep inet) + "\n"
end

def get_speed(interface)
    %x(ethtool #{interface} | grep Speed 2>/dev/null)
end

def get_duplex(interface)
    %x(ethtool #{interface} | grep Duplex 2>/dev/null)
end

def set_mode(interface, speed, duplex)
    %x(sudo ethtool -s #{interface} speed #{speed} duplex #{duplex})
    sleep(3)
    puts get_speed(interface)
    puts get_duplex(interface)
end

puts "Starting tests. "

set_mode(interface, 1000, "full")


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


