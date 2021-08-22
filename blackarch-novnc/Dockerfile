FROM ac1965/blackarch:latest

# Temporary patch to build on Ubuntu 20.04/10 & GitHub CI
# https://bugs.archlinux.org/index.php?do=details&task_id=69563
#
# Uncomment this run if you get a near immediate failure saying :
# error: failed to initialize alpm library
# (could not find or read directory: /var/lib/pacman/)
#
#RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
#    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
#    bsdtar -C / -xvf "$patched_glibc" && \

# hostapd-wpe needs make, but it's not a dep because it's assumed to be installed despite not being a dep
# @@  xorg-server-xvfb x11vnc xfce4 xfce4-goodies xfce4-power-manager blackarch-config-xfce blackarch-menus blackarch-wallpaper \
RUN pacman -Syu --noconfirm make && \
    # Install packages
    pacman -Syu --noconfirm --needed openssh vim tmux screen supervisor iw man mlocate pciutils less bash-completion novnc \
    xorg-server-xvfb x11vnc xfce4 xfce4-goodies blackarch-config-xfce blackarch-menus blackarch-wallpaper \
    blackarch-config-cursor blackarch-config-icons blackarch-config-zsh ttf-liberation \
    sudo ntp ttf-sazanami \
# add devel tools
    git gdb lib32-gcc-libs strace ltrace nasm \
# add pwn
    pwntools patchelf netcat socat \
# add radare2
    radare2 iaito python-r2pipe r2ghidra && \
# add gdb-peda
    git clone https://github.com/longld/peda.git /root/peda && \
    git clone https://github.com/scwuaptx/Pwngdb.git /root/Pwngdb && cp -f /root/Pwngdb/.gdbinit /root/.gdbinit  && \
# Point wallpaper to the right files
    sed -i 's/backgrounds\/blackarch.png/blackarch\/wallpaper.png/g' /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml && \
# Copy BlackArch configs
    cp -r /etc/skel/. /root/.

# Expose needed ports
EXPOSE 22/tcp
EXPOSE 8080/tcp

# Set operable environment
ENV DISPLAY=:0

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY timesyncd.conf /etc/system.d/timesyncd.conf
COPY aslr.sh /root/aslr.sh
COPY dotvim.tar /root/dotvim.tar
COPY dot.bashrc /root/.bashrc

WORKDIR /root
RUN tar xf dotvim.tar && rm -f dotvim.tar
RUN chmod +x aslr.sh
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf", "--pidfile", "/run/supervisord.pid"]
ENTRYPOINT []
