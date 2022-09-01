#!/bin/bash

device=`basename $DEVPATH`
devNum=$(echo $device | awk -F "" '{print $4}')

[[ $ACTION == "add" ]] && {
    mkdir -p /dev/sdcard
    mkdir -p /sd

    [[ $devNum == "" ]] && {
        rm -rf /dev/sdcard/sd
        ln -s /dev/$device /dev/sdcard/sd
    } || {
        rm -rf /dev/sdcard/sd$devNum
        ln -s /dev/$device /dev/sdcard/sd$devNum

        [[ $devNum == "1" ]] && {
            logger "Mount USB key as SD card."
            umount /sd
            mount /dev/sdcard/sd$devNum /sd && {
                [[ -e "/sd/etc" ]] || {
                    sleep 5
                    ln -s /etc/ /sd/etc
                }
            }

            if [[ -e "/sd/modules/" ]]; then
                logger "Link modules in /sd/modules/"
                for module in `ls /sd/modules/`; do
                    if [[ ! -d "/pineapple/modules/$module" ]]; then
                        ln -s /sd/modules/$module /pineapple/modules/$module
                    fi
                done
            fi

            if [[ ! -f "/sd/usr/lib/python2.7/encodings/__init__.pyc" ]]; then
                logger "Downloading extra packages."
                opkg update && opkg --dest sd install python-logging python-openssl python-sqlite3 python-codecs && python -m compileall
            fi
        }

        [[ $devNum == "2" ]] && {
            logger "Add swap"
            swapoff /dev/sdcard/sd$devNum
            swapon /dev/sdcard/sd$devNum
        }
    }
}

[[ $ACTION == "remove" ]] && {
    [[ $devNum == "" ]] && {
        umount /sd
        rm -rf /dev/sdcard/sd
    }

    [[ $devNum == "1" ]] && {
        rm -rf /dev/sdcard/sd$devNum
    }

    [[ $devNum == "2" ]] && {
        swapoff /dev/sdcard/sd$devNum
    }
}