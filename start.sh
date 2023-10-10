#!/bin/bash

username="serveruser"
password="123456"
vncpassword="123456"

# useradd test -p test -m
useradd $username -p $password -m
# echo "123456" | vncpasswd -f > /home/test/.vnc/passwd
echo $vncpassword | vncpasswd -f > /home/$username/.vnc/passwd

# su test
su $username
vncserver
