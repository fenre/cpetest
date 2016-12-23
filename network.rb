#!/usr/bin/env ruby
module Network
    def show_ip(interface)
        puts %x(ip a show dev #{interface} | grep inet) + "\n"
    end

    def get_speed(interface)
        %x(ethtool #{interface} | grep Speed 2>/dev/null)
    end

    def get_duplex(interface)
        %x(ethtool #{interface} | grep Duplex 2>/dev/null)
    end

    def eth_mode(interface, speed, duplex)
        %x(sudo ethtool -s #{interface} speed #{speed} duplex #{duplex})
        get_speed(interface)
    end
end