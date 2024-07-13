#!/bin/bash

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Start OpenVPN
openvpn --config /etc/openvpn/config.ovpn --auth-user-pass /etc/openvpn/auth.txt &

# Wait for the VPN connection to establish
sleep 10

# Get the tun interface
TUN_IFACE=$(ip -o addr show | grep tun | awk '{print $2}')
echo "TUN interface: $TUN_IFACE"

# Set iptables rules for NAT
iptables -t nat -A POSTROUTING -o $TUN_IFACE -j MASQUERADE

# Keep the script running
wait
