#!/bin/bash

pamodindex=$(pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket)
echo "Loaded module into module index: " $pamodindex

echo "Starting Beam in Docker..."

sudo docker run -ti --rm -e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /usr/share/X11/xkb:/usr/share/X11/xkb  \
-v /etc/machine-id:/etc/machine-id \
-v /var/lib/dbus:/var/lib/dbus \
-e PULSE_SERVER=unix:/tmp/pulseaudio.socket \
-e PULSE_COOKIE=/tmp/pulseaudio.cookie \
-v /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
-u $(id -u):video \
--mount source=beam-john,target=/.beam \
--net=host \
--privileged=true \
johnnyshreeves/beam-john-docker-test:script-ready

echo "Cleaning up..."

pactl unload-module $pamodindex
echo "Unloaded module at module index: " $pamodindex