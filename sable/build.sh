#!/bin/bash

function base {
	echo "Building scarfaced/sable:base"
	debootstrap --variant=minbase --components=main,contrib,non-free --include=kali-archive-keyring kali-last-snapshot base https://kali.download/kali > base.log
	echo "Customizing scarfaced/sable:base"
	echo "deb http://kali.download/kali kali-last-snapshot main contrib non-free" > base/etc/apt/sources.list
	echo "Importing scarfaced/sable:base in docker"
	tar -C base -c . | docker import - scarfaced/sable:base
}

base
