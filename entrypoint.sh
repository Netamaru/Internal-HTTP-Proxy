#!/bin/bash

# Wait for the OpenVPN client to establish the connection
sleep 10

# Get the gateway IP of the openvpn-client container
VPN_GATEWAY=$(getent hosts openvpn | awk '{ print $1 }')
echo "VPN Gateway: $VPN_GATEWAY"

# Display the current routing table
echo "Current Routing Table:"
ip route

# Set the default route to the VPN gateway
ip route del default
ip route add default via $VPN_GATEWAY

# Display the updated routing table
echo "Updated Routing Table:"
ip route

# Start Squid
exec squid -N -f /etc/squid/squid.conf
