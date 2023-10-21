#!/bin/bash

apt update -qq && apt upgrade -y -qq && apt install sudo locales --yes
dpkg-reconfigure -f noninteractive tzdata
apt update && apt upgrade -y -qq
apt install apt-utils -y -qq
apt update && apt upgrade -y -qq

echo "--- install nano ---" 
apt install nano -y -qq 

echo "--- install xmlstarlet ---" 
apt install xmlstarlet -y -qq

echo "--- install dbus-x11 ---" 
apt install dbus-x11 -y -qq

echo "--- install lighttpd ---" 
apt install lighttpd -y -qq

echo "--- install lxde-core ---" 
apt install lxde-core -y -qq

echo "--- install lxde ---" 
apt install lxde -y -qq

echo "--- install tightvncserver ---" 
apt install tightvncserver -y -qq

echo "--- install chromium ---" 
apt install chromium -y -qq

echo "--- systemctl ---" 
apt install systemctl -y -qq

echo "--- Configure x11 ---" 
echo "allowed_users = anybody" | tee -a /etc/X11/Xwrapper.config

echo "--- Configure lighttpd ---" 
echo "dir-listing.activate = \"enable\"" | tee -a /etc/lighttpd/lighttpd.conf
echo "dir-listing.encoding = \"utf-8\"" | tee -a /etc/lighttpd/lighttpd.conf

systemctl restart lighttpd

