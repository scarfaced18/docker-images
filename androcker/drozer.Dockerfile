FROM debian:buster

WORKDIR /root

RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y wget python python-pip unzip openjdk-11-jdk && \
    cd /tmp && \
    wget https://github.com/FSecureLABS/drozer/releases/download/2.4.4/drozer-2.4.4-py2-none-any.whl && \
    wget https://github.com/FSecureLABS/drozer/releases/download/2.4.4/drozer_2.4.4.deb && \
    pip install wheel pyyaml pyhamcrest protobuf pyopenssl twisted service_identity && \
    pip install ./drozer-2.4.4-py2-none-any.whl && \
    apt-get install ./drozer_2.4.4.deb -y && \
    rm -rf drozer-2.4.4-py2-none-any.whl drozer_2.4.4.deb && \
    cd /opt && \
    wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && \
    unzip platform-tools-latest-linux.zip && \
    rm -rf platform-tools-latest-linux.zip && \
    cd /root && \
    ln -s /opt/platform-tools/adb /usr/local/bin/adb-pt && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
