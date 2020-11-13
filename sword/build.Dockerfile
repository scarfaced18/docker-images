FROM archlinux/base
ADD ./build.sh /usr/local/bin
ADD ./build-helper.sh /usr/local/bin
ADD ./build-pacman.conf /usr/local/etc
RUN pacman --noconfirm -Sy archlinux-keyring && \
    pacman --noconfirm -S expect sed tar arch-install-scripts && \
    pacman -Scc && \
    chmod +x /usr/local/bin/build.sh && \
    chmod +x /usr/local/bin/build-helper.sh
VOLUME ["/build"]
WORKDIR /build
ENTRYPOINT ["/usr/local/bin/build.sh"]
