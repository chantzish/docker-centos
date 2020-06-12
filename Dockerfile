FROM centos
RUN yun check-update && yum -y update && yum install sudo hostname langpacks-en langpacks-he epel-release && \
    useradd -u 1000 -U -G adm,cdrom,wheel -m user && yes "1234" | passwd user
# USER user
USER 1000
WORKDIR /home/user
ENV HOME=/home/user
ENV USER=user
ENV LANG=en_US.UTF-8
EXPOSE 8000/tcp
RUN echo 1234 | sudo -S yum install -y \
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
    
    p7zip-full \?
    
RUN echo 1234 | sudo -S ln -sv pythpn2 /usr/bin/python
RUN echo 1234 | sudo -S yum localinstall jdk-8u251-linux-x64.rpm
RUN echo 1234 | sudo -S yum groupinstall -y "Xfce"
RUN wget https://github.com/jordansissel/xdotool/releases/download/v3.20160805.1/xdotool-3.20160805.1.tar.gz &&
    tar zxf xdotool-3.20160805.1.tar.gz $$ \
    cd xdotool-3.20160805.1 && \
    make && \
    echo 1234 | sudo -S  make install
    

#RUN echo 1234 | sudo -S dnf install -y “Xfce Desktop”
#RUN echo 1234 | sudo -S yum group install \
    # “Server with GUI”
    # "Gnome"
#RUN echo 1234 | sudo -S dnf group install -y gnome-desktop base-x

CMD /home/user/fix.sh & /home/user/launch-gui.sh & /home/user/launch.sh 




xstartup:
#!/bin/sh
vncconfig -nowin &
xfce4-session &


?
sudo dnf check
sudo yum module enable perl:5.26
sudo dnf check



http://ns1.iranns.ir/jdk-11.0.7_linux-x64_bin.rpm
http://ns1.iranns.ir/jdk-8u251-linux-x64.rpm
https://oraclemirror.np.gy/jdk8/jdk-8u251-linux-x64.rpm
