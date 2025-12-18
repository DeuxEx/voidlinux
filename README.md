#!/bin/sh


First install the computer with a iso from void.

https://voidlinux.org/download/



update the packages when you have rebooted the computer
xbps-install -Suv


//Run the install.sh to install some nice features, like htop, telnet, mc etc etc

https://github.com/DeuxEx/voidlinux/blob/main/after_install.sh

#Enable flatpak repository

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo



The default DE/Window manager is xfce and Ive configured this and made a tarball of it
You can download it and install the .tar file

#how i created the tarball
#tar --create --file test.tar --verbose .config/xfce4/xfconf/xfce-perchannel-xml/*
#extract
tar --extract --file test.tar --verbose
#show content
ls -l .config/xfce4/xfconf/xfce-perchannel-xml/




Troubleshooting
Cannot login to xfce and no network

Write your ssid and passphrase into the default conf:

wpa_passphrase "MYSSID" "passphrase" >> /etc/wpa_supplicant/wpa_supplicant.conf

Enable the necessary services:
ln -s /etc/sv/wpa_supplicant /var/service
ln -s /etc/sv/dhcpcd /var/service

Run the services:
sv -v up wpa_supplicant
sv -v up dhcpcd





