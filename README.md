#!/bin/sh

#This is just some notes,configs and reminders for myself on how I install my Void Linux environment.


#First install the computer with a iso from void.

#https://voidlinux.org/download/

#I use glibc with xfce window manager
#musl is for thinner single processing computers without need of GPU and other repositories than the default in xbps.

#glibc
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-xfce.iso
#musl
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-musl-20250202-xfce.iso


#Run the install.sh to install some nice features, like htop, telnet, mc etc etc


xbps-install git
git clone https://github.com/DeuxEx/voidlinux

bash voidlinux/after_install.sh g


#Enable flatpak repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


#The default DE/Window manager is xfce and Ive configured this and made a zip of it

unzip -o voidlinux/xfce_settings_rev1.zip


#how i created the zip, -r = recurse
#zip -r xfce_settings_rev1.zip .config/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/ ~/.bashrc ~/.bash_profile /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml /etc/skel/.bashrc /etc/skel/.bash_profile ~/.inputrc /home/void/.config/xfce4/panel/launcher-*




