#!/usr/bin/env ruby

current = "Current IP Configuration"
def show_ip()
    puts %x(ip a show dev enp8s0 | grep inet) + "\n"
end

def get_speed()
    speed = %x(ethtool enp8s0 | grep Speed)
end

def get_duplex()
    duplex = %x(ethtool enp8s0 | grep Duplex)
end

def ethernet_half()
  %x(sudo ethtool -s enp8s0 speed 10 duplex half)
end

def ethernet_full()
  %x(sudo ethtool -s enp8s0 speed 10 duplex full)
end

puts "Starting tests. "

puts current
show_ip()
ethernet_half()
get_speed()
get_duplex()
puts "Setting mode: \n" + speed + duplex

puts current
show_ip()

ethernet_full()
get_speed()
get_duplex()
puts "Setting mode: \n" + speed + duplex