#!/usr/bin/env ruby
#require 'network'

module Networking
    
    def show_ip(interface)
        puts %x(ip a show dev #{interface} | grep inet) + "\n"
    end
    def get_speed(interface)
        %x(ethtool #{interface} | grep Speed 2>/dev/null)
    end

    def get_duplex(interface)
        %x(ethtool #{interface} | grep Duplex 2>/dev/null)
    end

end


current = "Current IP Configuration"
eth1 = "enp8s0"

class EthernetMode
    include Networking
    
    def initialize(interface="enp8s0")
        @interface = interface
        puts "Starting tests. "
    end

    def print_status
        puts "Settings on interface #{@interface} after configuration:"
        puts get_speed(@interface)
        puts get_duplex(@interface)
        puts "-" * 10
    end

    def set_mode(speed, duplex)    
        %x(sudo ethtool -s #{@interface} speed #{speed} duplex #{duplex})
        puts "Configuring #{@interface} to #{speed}MB/s and #{duplex} duplex. \n..."
        sleep(3)
        print_status
    end
end

first = EthernetMode.new
first.print_status

#show_ip(interface)
#set_mode(interface,10,"full")
#set_mode(interface,10,"half")
#set_mode(interface,100,"full")
#set_mode(interface,100,"half")
#set_mode(interface,1000,"full")

