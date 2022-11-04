#!/bin/bash

set -e

cmake -B ./build -S .
make -j8 -C build

# Assuming:
#
#/etc/network/interfaces.d/tap0:
#iface tap0 inet manual
#    pre-up ip tuntap add tap0 mode tap user leon group leon
#    pre-up ip addr add 192.168.3.3/24 dev tap0
#    up ip link set dev tap0 up
#    post-down ip link del dev tap0

# rock as remote peer
PRECONFIGURED_TAPIF=tap0 ./build/echop \
-t 192.168.3.4 -n 255.255.255.0 -w 192.168.3.3 \
-g 10.16.0.30 -i 10.16.0.10 -m 255.255.255.0 -s "ONj6Iefel47uMKtWRCSMLan2UC5eW3Fj9Gsy9bqcyEc=" \
-e 192.168.3.3 -p "OsO3R4yqJpCwnVUgHwVSSZgxXIWQYikpCBZhn8W4YFo="
