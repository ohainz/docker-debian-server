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

echo "Restart lighttpd"
systemctl restart lighttpd

echo "Create user $UserName"
# useradd test -p test -m
useradd $UserName -p $Password -m

echo "Create folder .vnc"
# mkdir /home/test/.vnc
mkdir /home/$UserName/.vnc

echo "Create folder VNC Password file"
# echo "123456" | vncpasswd -f > /home/test/.vnc/passwd
echo $VNCPassword | vncpasswd -f > /home/$UserName/.vnc/passwd

echo "Change owner of .vnc folder"
# chown -R test:test /home/test/.vnc
chown -R $UserName:$UserName /home/$UserName/.vnc

echo "Change mod of .vnc/passwd file"
# chmod 0600 /home/test/.vnc/passwd
chmod 0600 /home/$UserName/.vnc/passwd

echo "Start VNC Server for user $UserName"
# runuser -l  test -c 'vncserver'
runuser -l  $UserName -c 'vncserver'

echo "Wait infinity"
sleep infinity


