#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt -qq update && apt -qq upgrade -y && apt install sudo locales --yes
dpkg-reconfigure -f noninteractive tzdata
apt -qq update && apt -qq upgrade -y
apt -yq install apt-utils -y
apt -qq update && apt -qq upgrade -y

echo "--------------------------------------------------------------------------------" 
echo "--- install nano ---" 
apt -yq install nano -y 

echo "--------------------------------------------------------------------------------" 
echo "--- install xmlstarlet ---" 
apt -yq install xmlstarlet -y

echo "--------------------------------------------------------------------------------" 
echo "--- install dbus-x11 ---" 
apt -yq install dbus-x11 -y

echo "--------------------------------------------------------------------------------" 
echo "--- install lighttpd ---" 
apt -yq install lighttpd -y

echo "--------------------------------------------------------------------------------" 
echo "--- systemctl ---" 
apt -yq install systemctl -y

echo "--------------------------------------------------------------------------------" 
echo "--- install tightvncserver ---" 
apt -yq install tightvncserver -y

echo "--------------------------------------------------------------------------------" 
echo "--- install lxde ---" 
apt -yq install lxde -y

echo "--------------------------------------------------------------------------------" 
echo "--- install chromium ---" 
apt -yq install chromium -y

echo "--------------------------------------------------------------------------------" 
echo "--- Configure x11 ---" 
echo "allowed_users = anybody" | tee -a /etc/X11/Xwrapper.config

echo "--------------------------------------------------------------------------------" 
echo "--- Configure lighttpd ---" 
echo "dir-listing.activate = \"enable\"" | tee -a /etc/lighttpd/lighttpd.conf
echo "dir-listing.encoding = \"utf-8\"" | tee -a /etc/lighttpd/lighttpd.conf

export DEBIAN_FRONTEND=
systemctl restart lighttpd
dbus-launch
startlxde


