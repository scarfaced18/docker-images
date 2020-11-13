#!/bin/bash

function base {
	echo "Building scarfaced/onyx:base"
	debootstrap --variant=minbase --components=main,contrib,non-free --include=kali-archive-keyring kali-rolling base https://kali.download/kali > base.log
	echo "Customizing scarfaced/onyx:base"
	echo "deb http://kali.download/kali kali-rolling main contrib non-free" > base/etc/apt/sources.list
	echo "Importing scarfaced/onyx:base in docker"
	tar -C base -c . | docker import - scarfaced/onyx:base
}

base
