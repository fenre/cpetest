#!/usr/bin/env ruby
load "network.rb"

class EthernetMode
    include Networking

    def initialize(interface="enp8s0")
        @interface = interface
        puts "Starting tests. "
    end

    def print_status
        puts "Settings on interface #{@interface} after configuration:"
        get_speed(@interface)
        puts get_duplex(@interface)
        puts "-" * 60
    end

    def set_mode(speed, duplex)    
        %x(sudo ethtool -s #{@interface} speed #{speed} duplex #{duplex})
        puts "Configuring #{@interface} to #{speed}MB/s and #{duplex} duplex. \n..."
        sleep(3)
        print_status
    end
end

first = EthernetMode.new
first.set_mode(10,"half")

#show_ip(interface)
#set_mode(interface,10,"full")
#set_mode(interface,10,"half")
#set_mode(interface,100,"full")
#set_mode(interface,100,"half")
#set_mode(interface,1000,"full")

