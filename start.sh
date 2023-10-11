#!/bin/bash

if [ -z "$UserName" ]
then
    echo "UserName is not defined"
    UserName="test"
fi

if [ -z "$Password" ]
then
    echo "Password is not defined"
    Password="test"
fi

if [ -z "$VNCPassword" ]
then
    echo "VNCPassword is not defined"
    VNCPassword="test"
fi

systemctl restart lighttpd

# useradd test -p test -m
useradd $UserName -p $Password -m
# mkdir /home/test/.vnc
mkdir /home/$UserName/.vnc
# echo "123456" | vncpasswd -f > /home/test/.vnc/passwd
echo $VNCPassword | vncpasswd -f > /home/$UserName/.vnc/passwd
# chown -R test:test /home/test/.vnc
chown -R $UserName:$UserName /home/$UserName/.vnc
# chmod 0600 /home/test/.vnc/passwd
chmod 0600 /home/$UserName/.vnc/passwd
# su test
su $UserName
vncserver




