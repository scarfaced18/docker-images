FROM kalilinux/kali

RUN echo "deb http://kali.download/kali kali-last-snapshot main contrib non-free" > /etc/apt/sources.list && \
   apt-get -y update && \
   apt-get -y dist-upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y \
   libwww-perl uniscan && \
   apt-get -y autoremove && \
   apt-get -y clean && \
   rm -rf /var/lib/apt/lists/*
