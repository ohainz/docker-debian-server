#!/bin/bash

apt update && apt upgrade -y && apt install sudo locales --yes
dpkg-reconfigure -f noninteractive tzdata
apt update && apt upgrade -y
apt install apt-utils -y
apt update && apt upgrade -y

apt install nano -y
apt install xmlstarlet -y
apt install lighttpd -y
DEBIAN_FRONTEND=noninteractive apt-get install lxde-core lxde -y
apt install tightvncserver -y
apt install dbus-x11 -y
apt install chromium -y
apt install systemctl -y

echo "allowed_users = anybody" | tee -a /etc/X11/Xwrapper.config
echo "dir-listing.activate = \"enable\"" | tee -a /etc/lighttpd/lighttpd.conf
echo "dir-listing.encoding = \"utf-8\"" | tee -a /etc/lighttpd/lighttpd.conf

systemctl restart lighttpd

