FROM ubuntu:20.04

WORKDIR /root

COPY settings.py /tmp/

COPY start.sh /tmp/

RUN apt-get update && \
	apt-get dist-upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
	git wget unzip python3.7 openjdk-8-jdk python3-dev python3-venv python3-pip build-essential libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev wkhtmltopdf && \
	cd /opt && \
	wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && \
  	unzip platform-tools-latest-linux.zip && \
   	rm -rf platform-tools-latest-linux.zip && \
	git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF.git && \
	cd Mobile-Security-Framework-MobSF && \
	./setup.sh && \
	cd /root && \
	rm -rf /opt/Mobile-Security-Framework-MobSF/MobSF/settings.py && \
	cp /tmp/settings.py /opt/Mobile-Security-Framework-MobSF/MobSF/ && \
	cp /tmp/start.sh /opt/Mobile-Security-Framework-MobSF/ && \
	chmod +x /opt/Mobile-Security-Framework-MobSF/start.sh && \
	apt-get autoremove -y && \
    	apt-get clean -y && \
    	rm -rf /var/lib/apt/lists/* && \
	rm -rf /tmp/settings.py && \
	rm -rf /tmp/start.sh

CMD ["bin/bash"]
