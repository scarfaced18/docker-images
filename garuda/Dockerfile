FROM kalilinux/kali-rolling
COPY files/* /tmp/
RUN apt-get -y update && \
   apt-get -y dist-upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y nano curl wget git netcat python2 python3 python3-pip p7zip-full p7zip-rar p7zip unzip net-tools build-essential iputils-ping pciutils bash-completion kali-linux-core && \
   apt-get -y autoremove && \
   mkdir -p /data && \
   mkdir -p /web && \
   touch ~/.hushlogin && \
   cp /tmp/.bash_profile /root/.bash_profile && \
   cp /tmp/.bashrc /root/.bashrc && \
   cp /tmp/shadow /etc/shadow && \
   cp /tmp/sshd_config /etc/ssh/sshd_config && \
   cp /tmp/index.html /web/index.html && \
   rm -rf /tmp/* && \
   echo "service ssh start && python3 -m http.server -d /web/ 80" > /start && \
   chmod +x /start
CMD /./start
