FROM scarfaced/onyx:base

RUN apt-get -y update && \
   apt-get -y dist-upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y nano curl wget git netcat python2 python3 python3-pip p7zip-full p7zip-rar p7zip unzip net-tools build-essential iputils-ping pciutils bash-completion kali-linux-core && \
   apt-get -y autoremove && \
   apt-get -y clean && \
   rm -rf /var/lib/apt/lists/* && \
   wget https://gist.githubusercontent.com/scarfaced18/aabefc19aeabc8d21771ad1a678e0b63/raw/942fb264b44806b6f6866016c201c0cb557c7666/.bashrc -O /root/.bashrc

CMD ["/bin/bash"]
