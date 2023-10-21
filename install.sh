#!/bin/bash

apt update && apt upgrade -y && apt install sudo locales --yes
dpkg-reconfigure -f noninteractive tzdata
apt update && apt upgrade -y
apt install apt-utils -y
apt update && apt upgrade -y

echo "--- install nano ---" 
apt install nano -y

echo "--- install xmlstarlet ---" 
apt install xmlstarlet -y

echo "--- systemctl ---" 
apt install systemctl -y

echo "--- install dbus-x11 ---" 
apt install dbus-x11 -y

echo "--- install lighttpd ---" 
apt install lighttpd -y

echo "--- install lxde-core ---" 
apt install lxde-core -y

echo "--- install lxde ---" 
apt install lxde -y

echo "--- install tightvncserver ---" 
apt install tightvncserver -y

echo "--- install chromium ---" 
apt install chromium -y

echo "--- Configure x11 ---" 
echo "allowed_users = anybody" | tee -a /etc/X11/Xwrapper.config

echo "--- Configure lighttpd ---" 
echo "dir-listing.activate = \"enable\"" | tee -a /etc/lighttpd/lighttpd.conf
echo "dir-listing.encoding = \"utf-8\"" | tee -a /etc/lighttpd/lighttpd.conf

systemctl restart lighttpd

