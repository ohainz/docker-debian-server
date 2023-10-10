#!/bin/bash

if [ -n $UserName ] then 
    UserName = "test"
fi
if [ -n $Password ] then 
    Password = "test"
fi
if [ -n $VNCPassword ] then 
    UserName = "123456"
fi

systemctl restart lighttpd

# useradd test -p test -m
useradd $UserName -p $Password -m
# echo "123456" | vncpasswd -f > /home/test/.vnc/passwd
echo $VNCPassword | vncpasswd -f > /home/$UserName/.vnc/passwd

# su test
su $UserName
vncserver
