#!/bin/bash

username="serveruser"
password="123456"
vncpassword="123456"

apt update && apt upgrade -y && apt install sudo locales --yes
dpkg-reconfigure -f noninteractive tzdata
apt update && apt upgrade -y

apt install nano -y
apt install lighttpd -y
DEBIAN_FRONTEND=noninteractive apt install xfce4 xfce4-goodies -y
apt install tightvncserver -y
apt install dbus-x11 -y
apt install systemctl -y

echo "dir-listing.activate = \"enable\"" | tee -a /etc/lighttpd/lighttpd.conf
echo "dir-listing.encoding = \"utf-8\"" | tee -a /etc/lighttpd/lighttpd.conf

systemctl restart lighttpd
systemctl start 

# useradd test -p test -m
useradd $username -p $password -m
# echo "123456" | vncpasswd -f > /home/test/.vnc/passwd
echo $vncpassword | vncpasswd -f > /home/$username/.vnc/passwd

# su test
su $username
vncserver
