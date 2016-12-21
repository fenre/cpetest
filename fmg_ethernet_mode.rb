#!/usr/bin/env ruby

current = "Current IP Configuration"
show_ip = %x(ip a show dev enp8s0 | grep inet) + "\n"
speed = %x(ethtool enp8s0 | grep Speed)
duplex = %x(ethtool enp8s0 | grep Duplex)
def ethernet_half()
  %x(sudo ethtool -s enp8s0 speed 10 duplex half)
end

def ethernet_full()
  %x(sudo ethtool -s enp8s0 speed 10 duplex full)
end

puts "Starting tests. "

puts current
puts show_ip
ethernet_half()
speed
duplex
puts "Setting mode: \n" + speed + duplex

puts current
puts show_ip

ethernet_full()
speed
duplex
puts "Setting mode: \n" + speed + duplex