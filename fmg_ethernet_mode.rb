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
        puts get_speed(@interface)
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

def full_test_run
    full = EthernetMode.new
    full.set_mode(10,"half")
    full.set_mode(10,"full")
    full.set_mode(100,"half")
    full.set_mode(100,"full")
    full.set_mode(1000,"half")
    full.set_mode(1000,"full")
    return "Finished full test run. "
end

def single_test_run(speed, duplex)
    single = EthernetMode.new
    single.set_mode(speed, duplex)
    return "Finishet single test run. "
end

unless ARGV[0] == "single" || ARGV[0] == "full"
    puts "Argument should be 'single' or 'full'. "
    exit
 end
 
run = ARGV[0]
(run == "single" ? single_test_run(10,"half") : full_test_run)