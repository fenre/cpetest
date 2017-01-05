#!/usr/bin/env ruby

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