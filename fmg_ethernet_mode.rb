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

def print_status(interface)
    puts "Settings on interface #{interface} after configuration:"
    puts get_speed(interface)
    puts get_duplex(interface)
    puts "-------------------"
end

def set_mode(interface, speed, duplex)    
    %x(sudo ethtool -s #{interface} speed #{speed} duplex #{duplex})
    puts "Configuring #{interface} to #{speed}MB/s and #{duplex} duplex. \n..."
    sleep(3)
    print_status(interface)
end

puts "Starting tests. "
show_ip(interface)

set_mode(interface,10,"full")
set_mode(interface,10,"half")
set_mode(interface,100,"full")
set_mode(interface,100,"half")
set_mode(interface,1000,"full")



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


