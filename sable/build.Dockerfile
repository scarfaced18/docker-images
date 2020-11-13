FROM kalilinux/kali:latest

COPY build.sh /root/

WORKDIR /root/

RUN	echo "deb http://kali.download/kali kali-last-snapshot main contrib non-free" > /etc/apt/sources.list && \
	apt-get update && \
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
