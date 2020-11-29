FROM kalilinux/kali

WORKDIR /root

RUN echo "deb http://kali.download/kali kali-last-snapshot main contrib non-free" > /etc/apt/sources.list && \
	apt-get update && \
	apt-get dist-upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y nano curl wget unzip git netcat python2 python3 python3-pip p7zip-full p7zip-rar p7zip unzip net-tools build-essential iputils-ping pciutils bash-completion apt-transport-https software-properties-common ca-certificates openjdk-11-jdk openjdk-11-jre jadx dex2jar && \
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
	echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | tee /etc/apt/sources.list.d/docker-engine.list && \
	apt-get update -y && apt-get install -y docker-ce docker-ce-cli containerd.io && \
	cd /opt && \
	wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && \
	unzip platform-tools-latest-linux.zip && \
	rm -rf platform-tools-latest-linux.zip && \
	wget https://github.com/iBotPeaches/Apktool/releases/download/v2.4.1/apktool_2.4.1.jar -O apktool.jar && \
	cd /root && \
	ln -s /opt/platform-tools/adb /usr/local/bin/adb && \
	echo "java -jar /opt/apktool.jar">/usr/local/bin/apktool && \
	chmod +x /usr/local/bin/adb && \
	chmod +x /usr/local/bin/apktool && \
	pip3 install frida-tools objection && \
	echo 'docker run -it --rm -w="/root" --net=host -v $AHOME/.androcker:/root/ scarfaced/androcker:drozer /bin/bash -c "cd /opt/platform-tools/ && ./adb connect $GENY:5555 && ./adb forward tcp:31415 tcp:31415 && drozer console connect"' > /usr/local/bin/drozer && \
	echo 'docker run -it --rm -w="/root" --net=host -v $AHOME/.androcker:/root/ scarfaced/androcker:mobsf /bin/bash -c "cd /opt/platform-tools/ && ./adb connect $GENY:5555 && cd /opt/Mobile-Security-Framework-MobSF && ./start.sh $GENY"' > /usr/local/bin/mobsf && \
	chmod +x /usr/local/bin/drozer && \
	chmod +x /usr/local/bin/mobsf && \
	apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
