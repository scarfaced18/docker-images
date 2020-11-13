FROM scarfaced/macaw:core

RUN	apt-get update && \
	apt-get -y dist-upgrade && \
  	DEBIAN_FRONTEND=noninteractive apt-get install -y parrot-pico parrot-mini parrot-tools-cloud && \
	apt-get -y autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
