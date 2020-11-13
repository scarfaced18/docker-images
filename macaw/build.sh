#!/bin/bash

function base {
	echo "Building scarfaced/macaw:base"
	debootstrap --arch=amd64 --components=main,contrib,non-free --include=apt-parrot --exclude=parrot-core rolling base https://mirror.parrot.sh/mirrors/parrot > base.log
	echo "Customizing scarfaced/macaw:base"
	rm base/etc/apt/sources.list
	cp base/etc/apt/sources.list.parrot base/etc/apt/sources.list
	echo "Importing scarfaced/macaw:base in docker"
	tar -C base -c . | docker import - scarfaced/macaw:base
}

base
