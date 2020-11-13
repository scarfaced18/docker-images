FROM scarfaced/sword:core

RUN pacman --noconfirm -Syu && pacman --noconfirm -S blackarch && pacman --noconfirm -Scc

CMD ["/usr/bin/bash"]
