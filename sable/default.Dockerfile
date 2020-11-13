FROM scarfaced/sable:core

RUN apt-get -y update && \
   apt-get -y dist-upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y kali-linux-default && \
   apt-get -y autoremove && \
   apt-get -y clean && \
   rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
