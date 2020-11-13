FROM scarfaced/macaw:headless

RUN	apt-get update && \
	apt-get -y dist-upgrade && \
  	DEBIAN_FRONTEND=noninteractive apt-get install -y parrot-tools-full && \
	apt-get -y autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
