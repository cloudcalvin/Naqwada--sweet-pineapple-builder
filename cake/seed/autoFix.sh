#!/bin/bash

sed -i 's/print $6/print $1/' cake/overlay/etc/hotplug.d/block/20-sd
sed -i 's/print $6/print $1/' cake/overlay/etc/hotplug.d/usb/30-sd
sed -i 's/print $6/print $1/' cake/overlay/etc/init.d/pineapple
sed -i 's/print $6/print $1/' cake/overlay/etc/rc.button/BTN_1
sed -i 's/print $6/print $1/' cake/overlay/etc/rc.button/reset
sed -i 's/print $6/print $1/' cake/overlay/etc/rc.d/S98pineapple
sed -i 's/print $6/print $1/' cake/overlay/etc/rc.local
sed -i 's/print $6/print $1/' cake/overlay/etc/uci-defaults/90-firewall.sh
sed -i 's/print $6/print $1/' cake/overlay/etc/uci-defaults/91-fstab.sh
sed -i 's/print $6/print $1/' cake/overlay/etc/uci-defaults/92-system.sh
sed -i 's/print $6/print $1/' cake/overlay/etc/uci-defaults/95-network.sh
sed -i 's/print $6/print $1/' cake/overlay/etc/uci-defaults/97-pineapple.sh
sed -i 's/print $6/print $1/' cake/overlay/sbin/led

sed -i 's/..Get Device/device="NANO"/' cake/overlay/etc/rc.button/BTN_1
sed -i 's/..Get Device/device="NANO"/' cake/overlay/etc/rc.button/reset
sed -i 's/..Get Device/device="NANO"/' cake/overlay/etc/rc.local
sed -i 's/..Get Version and Device/device="TETRA"/' cake/overlay/etc/uci-defaults/90-firewall.sh
sed -i 's/..Get Version and Device/device="NANO"/' cake/overlay/etc/uci-defaults/91-fstab.sh
sed -i 's/..Get Version and Device/device="TETRA"/' cake/overlay/etc/uci-defaults/95-network.sh
sed -i 's/..Get Version and Device/device="NANO"/' cake/overlay/etc/uci-defaults/97-pineapple.sh

sed -i 's/..Get device type/device="NANO"/' cake/overlay/etc/uci-defaults/92-system.sh
sed -i 's/..led (C) Hak5 2018/device="NANO"/' cake/overlay/sbin/led


if [[ "$1" == "WZR450HP2" || "$1" == "WZR600DHP" || "$1" == "WZRHPAG300H" || "$1" == "WZRHPG300NH" || "$1" == "WZRHPG300NH2" || "$1" == "WZRHPG450H" ]]; then
  printf "Fixing LED path for Buffalo $1\n"
  sed -i 's/wifi-pineapple-nano:blue:system/buffalo:green:status/' cake/overlay/sbin/led
  sed -i 's/wifi-pineapple-nano:blue:system/buffalo:green:status/' cake/overlay/etc/uci-defaults/92-system.sh
  sed -i 's/wifi-pineapple-nano:blue:system/buffalo:green:status/' cake/overlay/etc/uci-defaults/97-pineapple.sh
fi

if [[ "$1" == "DGL5500A1" || "$1" == "DIR835A1" || "$1" == "dir-869-a1" ]]; then
  printf "Fixing LED path for DLink $1\n"
  sed -i 's/wifi-pineapple-nano:blue:system/d-link:white:status/' cake/overlay/sbin/led
  sed -i 's/wifi-pineapple-nano:blue:system/d-link:white:status/' cake/overlay/etc/uci-defaults/92-system.sh
  sed -i 's/wifi-pineapple-nano:blue:system/d-link:white:status/' cake/overlay/etc/uci-defaults/97-pineapple.sh
fi

if [[ $1 = "gl-ar300" ]]; then
  printf "Fixing LED path for GL.iNet $1\n"
sed -i 's/wifi-pineapple-nano:blue:system/gl-ar300:wlan/' cake/overlay/sbin/led
sed -i 's/wifi-pineapple-nano:blue:system/gl-ar300:wlan/' cake/overlay/etc/uci-defaults/92-system.sh
sed -i 's/wifi-pineapple-nano:blue:system/gl-ar300:wlan/' cake/overlay/etc/uci-defaults/97-pineapple.sh
fi

if [ $1 = "gl-ar300m" ]; then
  printf "Fixing LED path for GL.iNet $1\n"
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar300m:green:system/' cake/overlay/sbin/led
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar300m:green:system/' cake/overlay/etc/uci-defaults/92-system.sh
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar300m:green:system/' cake/overlay/etc/uci-defaults/97-pineapple.sh
fi

if [ $1 = "gl-ar750" ]; then
  printf "Fixing LED path for GL.iNet $1\n"
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar750:white:power/' cake/overlay/sbin/led
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar750:white:power/' cake/overlay/etc/uci-defaults/92-system.sh
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar750:white:power/' cake/overlay/etc/uci-defaults/97-pineapple.sh
fi

if [ $1 = "gl-ar750s" ]; then
  printf "Fixing LED path for GL.iNet $1\n"
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar750s:green:power/' cake/overlay/sbin/led
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar750s:green:power/' cake/overlay/etc/uci-defaults/92-system.sh
  sed -i 's/wifi-pineapple-nano:blue:system/gl-ar750s:green:power/' cake/overlay/etc/uci-defaults/97-pineapple.sh
fi

if [[ "$1" == "archer-c7-v2" || "$1" == "archer-c7-v4" || "$1" == "archer-c7-v5" ]]; then
  printf "Fixing LED path for TP-LINK $1\n"
  sed -i 's/wifi-pineapple-nano:blue:system/tp-link:green:wps/' cake/overlay/sbin/led
  sed -i 's/wifi-pineapple-nano:blue:system/tp-link:green:wps/' cake/overlay/etc/uci-defaults/92-system.sh
  sed -i 's/wifi-pineapple-nano:blue:system/tp-link:green:wps/' cake/overlay/etc/uci-defaults/97-pineapple.sh
fi

cp cake/seed/pineapd cake/overlay/usr/sbin/pineapd
cp cake/seed/pineap cake/overlay/usr/bin/pineap
chmod +x cake/overlay/usr/sbin/pineapd
chmod +x cake/overlay/usr/bin/pineap


mkdir -p cake/overlay/lib/netifd/wireless
cp cake/seed/karma/mac80211.sh cake/overlay/lib/netifd/wireless/mac80211.sh
cp cake/seed/karma/hostapd.sh cake/overlay/lib/netifd/hostapd.sh
cp cake/seed/karma/hostapd_cli cake/overlay/usr/sbin/hostapd_cli
cp cake/seed/karma/wpad cake/overlay/usr/sbin/wpad
chmod +x cake/overlay/lib/netifd/wireless/mac80211.sh
chmod +x cake/overlay/lib/netifd/hostapd.sh
chmod +x cake/overlay/usr/sbin/hostapd_cli
chmod +x cake/overlay/usr/sbin/wpad


chmod +x cake/overlay/etc/init.d/pineapd
chmod +x cake/overlay/etc/uci-defaults/93-pineap.sh
chmod +x cake/overlay/pineapple/modules/Advanced/formatSD/format_sd
chmod +x cake/overlay/pineapple/modules/PineAP/executable/executable
rm -f cake/overlay/pineapple/fix-executables.sh

# Panel changes
sed -i 's/tetra/nulled/' cake/overlay/pineapple/js/directives.js
sed -i 's/tetra/nulled/' cake/overlay/pineapple/modules/ModuleManager/js/module.js
sed -i 's/nano/tetra/' cake/overlay/pineapple/modules/Advanced/module.html
sed -i 's/nano/tetra/' cake/overlay/pineapple/modules/ModuleManager/js/module.js
sed -i 's/nano/tetra/' cake/overlay/pineapple/modules/Reporting/js/module.js
sed -i 's/nano/tetra/' cake/overlay/pineapple/modules/Reporting/api/module.php
sed -i 's/unknown/tetra/' cake/overlay/pineapple/api/pineapple.php
sed -i "s/cat \/proc\/cpuinfo | grep 'machine'/echo 'tetra'/" cake/overlay/usr/bin/pineapple/site_survey

# fix docs size
truncate -s 0 cake/overlay/pineapple/modules/Setup/eula.txt
truncate -s 0 cake/overlay/pineapple/modules/Setup/license.txt


printf "Change default password for root account: root/root\n"
cp cake/seed/shadow cake/overlay/etc/shadow

printf "Updating default network configuration\n"
cp cake/seed/95-network.sh cake/overlay/etc/uci-defaults/95-network.sh

printf "Fixing default wifi config to use multiple wifi cards\n"
cp cake/seed/mac80211.sh cake/overlay/lib/wifi/mac80211.sh

printf "Fixing missing libubus2019 package\n"
cp cake/seed/libubus20191227_2019-12-27-041c9d1c-1_mips_24kc.ipk cake/openwrt-imagebuilder-19.07.2-ar71xx-generic.Linux-x86_64/packages/libubus20191227_2019-12-27-041c9d1c-1_mips_24kc.ipk

printf "Replacing the script 20-sd with a custom one to expand the router storage space with a USB stick.\n"
cp cake/seed/custom-20-sd.sh cake/overlay/etc/hotplug.d/block/20-sd
rm cake/overlay/etc/hotplug.d/usb/30-sd

printf "Fix hardware name in the banner\n"
sed -i 's/DEVICE\/$device/DEVICE\/TETRA/' cake/overlay/etc/uci-defaults/97-pineapple.sh