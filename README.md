#!/bin/sh

This is just some memory for myself on how I install my Void Linux environment.


First install the computer with a iso from void.

https://voidlinux.org/download/



update the packages when you have rebooted the computer
xbps-install -Suv


//Run the install.sh to install some nice features, like htop, telnet, mc etc etc


#download the file with wget
wget https://github.com/DeuxEx/voidlinux/blob/main/after_install.sh

#Enable flatpak repository

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo



The default DE/Window manager is xfce and Ive configured this and made a tarball of it
You can download it and install the .tar file

wget https://github.com/DeuxEx/voidlinux/blob/main/xfce_settings_rev1.tar


#how i created the tarball
#tar --create --file xfce_settings_rev1.tar --verbose .config/xfce4/xfconf/xfce-perchannel-xml/*
#extract
tar --extract --file xfce_settings_rev1.tar --verbose
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



Fastfetch info:
<img width="1059" height="582" alt="image" src="https://github.com/user-attachments/assets/db183a6a-b297-45cf-b026-061590b300c8" />


My flatpaks (containers)
<img width="1725" height="470" alt="image" src="https://github.com/user-attachments/assets/8f199211-95ff-4df9-a6d6-e36b6dfd0aab" />




