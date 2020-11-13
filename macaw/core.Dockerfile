FROM scarfaced/macaw:base

RUN	apt-get update && \
	apt-get -y dist-upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y nano curl wget git netcat python2 python3 python3-pip p7zip-full p7zip-rar p7zip unzip net-tools build-essential iputils-ping pciutils bash-completion && \
	apt-get -y autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
