FROM ubuntu:bionic
# COPY beam-2.22.12-Linux.deb /tmp
COPY beam-2.22.12-Linux_nopost.deb /tmp
COPY libpng12-0_1.2.54-1ubuntu1.1_amd64.deb /tmp
# COPY libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb /tmp
# COPY pulseaudio.sh /tmp
RUN apt-get update 
RUN apt upgrade -y
RUN apt install -y libssl1.0.0
RUN apt install -y libxcb-icccm4
RUN apt install -y libxcb-image0
RUN apt install -y libunwind8
RUN apt install -y libpulse0
RUN apt install -y libgl1
RUN apt install -y libglib2.0-0
RUN apt install -y libasound2
RUN apt install -y libusb-1.0-0
RUN apt install -y libcurl4
RUN apt install -y libxcb1
RUN apt install -y libqt5dbus5
RUN apt install -y lsb-release
RUN apt install -y libx11-xcb1
RUN apt install -y libfontconfig1
RUN apt install -y libxi6
RUN apt install -y libsm6
RUN apt install -y pulseaudio
RUN apt install -y libinput10
RUN apt install -y dbus-x11
# RUN apt install -y firefox
# RUN apt install -y chromium-browser
# RUN dpkg -i /tmp/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb 
RUN dpkg -i /tmp/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb 
# RUN dpkg -i /tmp/beam-2.22.12-Linux.deb 
RUN dpkg -i /tmp/beam-2.22.12-Linux_nopost.deb
# RUN bash /tmp/pulseaudio.sh
# RUN cat /root/.profile
# RUN echo "pulseaudio --start --log-target=syslog" >> /root/.profile
# ENV QT_QPA_PLATFORM_PLUGIN_PATH /opt/suitable/beam/bin/qt/plugins/platforms
# ENV QT_DEBUG_PLUGINS 1
ENV QT_XKB_CONFIG_ROOT /usr/share/X11/xkb

RUN mkdir -p /.beam
RUN chmod -R 777 /.beam

CMD /usr/bin/beam
# CMD bash