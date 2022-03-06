#!/bin/bash

# Install WineHQ and winbind, gnupg2 is required by apt-key
apt-get install -y gnupg2
echo "deb http://dl.winehq.org/wine-builds/ubuntu/ ${BASECODENAME} main" >> /etc/apt/sources.list
curl -o /tmp/Release.key https://dl.winehq.org/wine-builds/winehq.key
apt-key add /tmp/Release.key
rm -f /tmp/Release.key
dpkg --add-architecture i386
apt-get update
cat /etc/apt/sources.list
DEBIAN_FRONTEND=noninteractive apt-get install -y --install-recommends winehq-stable winbind

# Install WineTricks
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
mv winetricks /usr/local/bin