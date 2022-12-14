#!/bin/bash

uci set network.lan.type='bridge'
uci set network.lan.proto='static'
uci set network.lan.ipaddr='172.16.42.1'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.gateway='172.16.42.42'
uci set network.lan.dns='1.1.1.1, 1.0.0.1'

uci set network.usb=interface
uci set network.usb.ifname='usb0'
uci set network.usb.proto='dhcp'
uci set network.usb.dns='1.1.1.1, 1.0.0.1'

uci set network.wwan=interface
uci set network.wwan.proto='dhcp'
uci set network.wwan.dns='1.1.1.1, 1.0.0.1'

uci set network.wan.proto='dhcp'
uci set network.wan.dns='1.1.1.1, 1.0.0.1'

uci set network.wan6.proto='dhcpv6'

uci set wireless.@wifi-iface[1].ifname='wlan1'

uci commit network
uci commit wireless

exit 0