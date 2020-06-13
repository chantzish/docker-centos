FROM centos
RUN ( yum check-update || true ) && \
    yum -y update && \
    rm -rf /var/lib/rpm && \
    rpm --rebuilddb && \
    yum -y install dnf-plugins-core dnf-plugin-ovl sudo passwd hostname langpacks-en langpacks-he epel-release && \
    useradd -u 1000 -U -G adm,cdrom,wheel -m user && yes "1234" | passwd user
# USER user
USER 1000
WORKDIR /home/user
ENV HOME=/home/user
ENV USER=user
ENV LANG=en_US.UTF-8
ENV PORT=8000
EXPOSE 8000/tcp
RUN export PATH=/home/user/.local/bin/:/usr/games:$PATH && \
    echo 1234 | sudo -S yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    echo 1234 | sudo -S yum -y install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm && \
    echo 1234 | sudo -S dnf install -y 'dnf-command(config-manager)' && \
    echo 1234 | sudo -S dnf config-manager --set-enabled PowerTools && \
    echo 1234 | sudo -S yum check-update ; echo 1234 | sudo -S yum -y update && \
    echo 1234 | sudo -S yum groupinstall -y "Xfce" && \
    echo 1234 | sudo -S yum -y install \
        gcc make binutils gcc-toolset-9-binutils libX11-devel xorg-x11-drv-evdev xorg-x11-drv-fbdev xorg-x11-proto-devel qt5-qtx11extras-devel libxkbcommon-x11-devel xorg-x11-xtrans-devel xorg-x11-xkb-utils-devel xorg-x11-drv-wacom-devel xorg-x11-drv-evdev-devel xorg-x11-drv-libinput-devel libNX_X11-devel xorg-x11-server-devel libSM-devel libICE-devel libXi-devel libXp-devel libXt-devel libXv-devel libXft-devel libXmu-devel libXpm-devel libXext-devel libXtst-devel libXrandr-devel libXfont2-devel libXrender-devel libXxf86vm-devel libfontenc-devel libxkbfile-devel libXinerama-devel libXxf86dga-devel libxkbcommon-devel libXxf86misc-devel libXScrnSaver-devel \
        nginx \
        git \
        tigervnc-server \
        telnet \
        firefox \
        file-roller \
        xorg-x11-fonts-Type1 \
        python2 \
        python3 \
        python2-numpy \
        python3-numpy \
        wget \
        unzip \
        p7zip p7zip-plugins \
        evince \
        gedit \
        file \
        bc \
        #coreutils \
        time \
        fakeroot \
        vlc \
        golang \
        python2-virtualenv \
        openssh-server \
        yum-utils \
        net-tools \
        xorg-x11-utils \
        &&\
    echo 1234 | sudo -S ln -sv python2 /usr/bin/python && \
    wget https://oraclemirror.np.gy/jdk8/jdk-8u251-linux-x64.rpm && \
    echo "68023f6e23988096692e143537279124ea60cb74cd66ba032fea9bf141b0dce1  jdk-8u251-linux-x64.rpm" | sha256sum -c && \
    echo 1234 | sudo -S yum -y localinstall jdk-8u251-linux-x64.rpm && \
    rm jdk-8u251-linux-x64.rpm && \
    export JAVA_HOME=/usr/java/jdk1.8.0_251-amd64 && \
    wget https://github.com/jordansissel/xdotool/releases/download/v3.20160805.1/xdotool-3.20160805.1.tar.gz && \
    tar zxf xdotool-3.20160805.1.tar.gz && \
    rm xdotool-3.20160805.1.tar.gz && \
    cd xdotool-3.20160805.1 && \
    make && \
    echo 1234 | sudo -S  make install && \
    cd .. && \
    rm -r xdotool-3.20160805.1 && \
    echo 1234 | sudo -S chmod 777 /opt && \
    git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    sed -i 's/${WEBSOCKIFY} ${SSLONLY} --web ${WEB}/${WEBSOCKIFY} ${SSLONLY} --heartbeat=45 --web ${WEB}/' /opt/noVNC/utils/launch.sh && \
    echo export LANG=en_US.UTF-8 >> .profile && \
    echo export HOME=/home/user >> .profile && \
    echo export PATH=/home/user/.local/bin/:/usr/games:$PATH >> .profile && \
    echo export JAVA_HOME=/usr/java/jdk1.8.0_251-amd64 >> .profile && \
    echo 1234 | sudo -S sed -i 's/load-module module-udev-detect/#load-module module-udev-detect/' /etc/pulse/default.pa && \
    echo 1234 | sudo -S sed -i 's/load-module module-detect/#load-module module-detect/' /etc/pulse/default.pa && \
    echo 1234 | sudo -S sed -i 's/load-module module-bluetooth-discover/#load-module module-bluetooth-discover/' /etc/pulse/default.pa && \
    echo 1234 | sudo -S sed -i 's/load-module module-bluetooth-policy/#load-module module-bluetooth-policy/' /etc/pulse/default.pa && \
    echo KexAlgorithms +diffie-hellman-group1-sha1 | sudo tee -a /etc/ssh/sshd_config && \
    echo "#HostKeyAlgorithms +ssh-dss" | sudo tee -a /etc/ssh/sshd_config && \
    echo "#MACs +hmac-sha1" | sudo tee -a /etc/ssh/sshd_config && \
    echo Ciphers +aes128-cbc | sudo tee -a /etc/ssh/sshd_config && \
    echo 1234 | sudo -S sed -i 's/#Port 22/Port 2200/' /etc/ssh/sshd_config && \
    wget https://github.com/novnc/websockify/raw/master/websockify/websocket.py && \
    wget https://github.com/chantzish/python-dewebsockify/raw/master/dewebsockify.py && \
    wget -O- https://telegram.org/dl/desktop/linux | tar xJ -C /opt/ && \
    echo 1234 | sudo -S ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop && \
    git clone https://github.com/gdrive-org/gdrive.git  && \
    mkdir .gdrive && \
    cd gdrive && \
    go get github.com/prasmussen/gdrive && \
    cd .. && \
    curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash - && \
    echo 1234 | sudo -S yum install -y nodejs && \
    git clone https://github.com/chantzish/dewebsockify.git && \
    cd dewebsockify && \
    npm install && \
    cd .. && \
    echo 1234 | sudo -S sed -i 's/OnlyShowIn=XFCE/NotShowIn=XFCE/' /etc/xdg/autostart/xfce-polkit.desktop && \
    echo 1234 | sudo -S sed -i 's/OnlyShowIn=XFCE/NotShowIn=XFCE/' /etc/xdg/autostart/xfce4-screensaver.desktop && \
    echo 1234 | sudo -S sed -i 's/NotShowIn=/NotShowIn=XFCE;/' /etc/xdg/autostart/xfce4-power-manager.desktop && \
    echo 1234 | sudo -S sed -i 's/NotShowIn=/NotShowIn=XFCE;/' /etc/xdg/autostart/geoclue-demo-agent.desktop && \
    echo 1234 | sudo -S sed -i 's/OnlyShowIn=XFCE/NotShowIn=XFCE/' /etc/xdg/autostart/xscreensaver.desktop && \
    cd /usr/local/lib && \
    curl "https://cli-assets.heroku.com/heroku-linux-x64.tar.xz" | sudo tar "xJ" && \
    echo 1234 | sudo -S ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku && \
    cd $OLDPWD && \
    heroku version && \
    heroku plugins:install heroku-builds && \
    if [ ! -d ".ssh" ]; then mkdir .ssh; fi && \
    chmod 700 ~/.ssh && \
    if [ ! -d ".vnc" ]; then mkdir .vnc; fi && \
    echo 1234 | sudo -S chown -R 1000:1000 /etc/ssh && \
    echo 1234 | sudo -S chmod -R 600 /etc/ssh/ssh_config.d/ && \
    echo 1234 | sudo -S chown -R 1000:1000 /etc/ssh /etc/nginx /usr/lib64/nginx/modules /usr/share/nginx /var/lib/nginx /var/log/nginx && \
    echo 1234 | sudo -S chown 1000:1000 /etc/logrotate.d/nginx && \
    echo 1234 | sudo -S chmod a+w /run && \
    if [ ! -d ".local/bin" ]; then mkdir -p .local/bin; fi && \
    mkdir Downloads && \
    if [ ! -d ".config/xfce4/xfconf/xfce-perchannel-xml" ]; then mkdir -p .config/xfce4/xfconf/xfce-perchannel-xml; fi && \
    echo -e "WebBrowser=firefox\n" > .config/xfce4/helpers.rc
#
#RUN echo 1234 | sudo -S dnf install -y "Xfce Desktop"
#RUN echo 1234 | sudo -S yum group install \
#    "Server with GUI" --allowerasing
#    "Gnome"
#RUN echo 1234 | sudo -S dnf group install -y gnome-desktop base-x
#
#sudo dnf check
#sudo yum module enable perl:5.26
#sudo dnf check
#
#http://ns1.iranns.ir/jdk-11.0.7_linux-x64_bin.rpm
#http://ns1.iranns.ir/jdk-8u251-linux-x64.rpm
COPY xfce4-panel.xml /home/user/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
COPY heroku.yml /home/user/heroku.yml
COPY xstartup /home/user/.vnc/xstartup
COPY nginx.template /home/user/nginx.template
COPY launch.sh /home/user/launch.sh
COPY launch-gui.sh /home/user/launch-gui.sh
COPY Dockerfile /home/user/Dockerfile
RUN echo 1234 | sudo -S chown 1000:1000 heroku.yml .vnc/xstartup nginx.template launch.sh launch-gui.sh Dockerfile .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml && \
    chmod +x launch.sh launch-gui.sh
CMD /home/user/launch-gui.sh & /home/user/launch.sh
