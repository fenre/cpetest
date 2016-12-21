#!/usr/bin/env ruby

current = "Current IP Configuration"
def show_ip()
    puts %x(ip a show dev enp8s0 | grep inet) + "\n"
end

def get_speed()
    %x(ethtool enp8s0 | grep Speed 2>/dev/null)
end

def get_duplex()
    %x(ethtool enp8s0 | grep Duplex 2>/dev/null)
end

def ethernet_half()
  puts %x(sudo ethtool -s enp8s0 speed 10 duplex half)
end

def ethernet_full()
  puts %x(sudo ethtool -s enp8s0 speed 10 duplex full)
end

puts "Starting tests. "

puts current
show_ip()
ethernet_half()
#get_speed()
#get_duplex()
puts "Setting mode: \n" + get_speed() + get_duplex()

puts current
show_ip()

ethernet_full()
puts "Setting mode: \n" + get_speed() + get_duplex()