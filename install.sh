#!/bin/bash

apt -qq update && apt -qq upgrade -y && apt install sudo locales --yes
dpkg-reconfigure -f noninteractive tzdata
apt -qq update && apt -qq upgrade -y
apt -qq install apt-utils -y
apt -qq update && apt -qq upgrade -y

echo "--------------------------------------------------------------------------------" 
echo "--- install nano ---" 
apt -qq install nano -y 

echo "--------------------------------------------------------------------------------" 
echo "--- install xmlstarlet ---" 
apt -qq install xmlstarlet -y

echo "--------------------------------------------------------------------------------" 
echo "--- install dbus-x11 ---" 
apt -qq install dbus-x11 -y

echo "--------------------------------------------------------------------------------" 
echo "--- install lighttpd ---" 
apt -qq install lighttpd -y

echo "--------------------------------------------------------------------------------" 
echo "--- install lxde-core ---" 
apt -qq install lxde-core -y

echo "--------------------------------------------------------------------------------" 
echo "--- install lxde ---" 
apt -qq install lxde -y

echo "--------------------------------------------------------------------------------" 
echo "--- install tightvncserver ---" 
apt -qq install tightvncserver -y

echo "--------------------------------------------------------------------------------" 
echo "--- install chromium ---" 
apt -qq install chromium -y

echo "--------------------------------------------------------------------------------" 
echo "--- systemctl ---" 
apt -qq install systemctl -y

echo "--------------------------------------------------------------------------------" 
echo "--- Configure x11 ---" 
echo "allowed_users = anybody" | tee -a /etc/X11/Xwrapper.config

echo "--------------------------------------------------------------------------------" 
echo "--- Configure lighttpd ---" 
echo "dir-listing.activate = \"enable\"" | tee -a /etc/lighttpd/lighttpd.conf
echo "dir-listing.encoding = \"utf-8\"" | tee -a /etc/lighttpd/lighttpd.conf

systemctl restart lighttpd

