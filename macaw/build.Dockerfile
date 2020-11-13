FROM parrotsec/core:base-rolling-amd64

COPY build.sh /root/

WORKDIR /root/

RUN	apt-get update && \
	apt-get -y dist-upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y debootstrap curl apt-transport-https software-properties-common ca-certificates && \
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
	echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | tee /etc/apt/sources.list.d/docker-engine.list && \
	apt-get update -y && \
	apt-get install -y docker-ce docker-ce-cli containerd.io && \
	apt-get -y autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* && \
	chmod +x build.sh

CMD ["./build.sh"]
