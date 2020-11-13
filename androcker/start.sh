#!/bin/bash

sed -i "s/192.168.56.100/$1/g" /opt/Mobile-Security-Framework-MobSF/MobSF/settings.py
/opt/Mobile-Security-Framework-MobSF/run.sh
