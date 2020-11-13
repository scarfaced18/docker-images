FROM scarfaced/sword:base

RUN pacman --noconfirm -Syu base base-devel bash-completion nano git wget curl netcat net-tools unzip p7zip python python-pip python2 python2-pip && pacman --noconfirm -Scc

CMD ["/usr/bin/bash"]
