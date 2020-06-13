FROM centos
RUN yum check-update ; yum -y update && yum -y install sudo passwd hostname langpacks-en langpacks-he epel-release && \
    useradd -u 1000 -U -G adm,cdrom,wheel -m user && yes "1234" | passwd user
# USER user
USER 1000
WORKDIR /home/user
ENV HOME=/home/user
ENV USER=user
ENV LANG=en_US.UTF-8
EXPOSE 8000/tcp
RUN echo 1234 | sudo -S yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
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
        &&\
    echo 1234 | sudo -S ln -sv pythpn2 /usr/bin/python && \
    wget https://oraclemirror.np.gy/jdk8/jdk-8u251-linux-x64.rpm && \
    echo "68023f6e23988096692e143537279124ea60cb74cd66ba032fea9bf141b0dce1  jdk-8u251-linux-x64.rpm" | sha256sum -c && \
    echo 1234 | sudo -S yum -y localinstall jdk-8u251-linux-x64.rpm && \
    rm jdk-8u251-linux-x64.rpm && \
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
    echo export PATH=$PATH:/home/user/.local/bin/ >> .profile && \
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
    heroku plugins:install heroku-builds
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

CMD /home/user/fix.sh & /home/user/launch-gui.sh & /home/user/launch.sh

xstartup:
#!/bin/sh

vncconfig -nowin &
xfce4-session &

nginx.template:
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/doc/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '${DOLLAR}remote_addr - ${DOLLAR}remote_user [${DOLLAR}time_local] "${DOLLAR}request" '
                      '${DOLLAR}status ${DOLLAR}body_bytes_sent "${DOLLAR}http_referer" '
                      '"${DOLLAR}http_user_agent" "${DOLLAR}http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    server {
        listen       ${PORT} default_server;
        listen       [::]:${PORT} default_server;
        server_name  _;
        root         /usr/share/nginx/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location /2200 {
            proxy_http_version 1.1;
            proxy_pass http://127.0.0.1:6090/;
            proxy_set_header Upgrade ${DOLLAR}http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_read_timeout 61s;
            proxy_buffering off;
        }

        location /websockify {
            proxy_http_version 1.1;
            proxy_pass http://127.0.0.1:6080/;
            proxy_set_header Upgrade ${DOLLAR}http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_read_timeout 61s;
            proxy_buffering off;
        }

        location ~* /(gui|proxy) {
            proxy_pass http://localhost:8080;
            proxy_set_header Host ${DOLLAR}http_host;
            proxy_set_header X-Real-IP ${DOLLAR}remote_addr;
            proxy_set_header X-Forwarded-For ${DOLLAR}proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto ${DOLLAR}scheme;
        }

        location /user {
            root /home;
            autoindex on;
        }

        location / {
            proxy_pass http://127.0.0.1:6080/;
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }
}
