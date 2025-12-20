#!/bin/sh

#This is just some memory for myself on how I install my Void Linux environment.


#First install the computer with a iso from void.

#https://voidlinux.org/download/

#xfce alternative
#I use musl with xfce

#glibc
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-xfce.iso
#musl
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-musl-20250202-xfce.iso


#Run the install.sh to install some nice features, like htop, telnet, mc etc etc

#The default DE/Window manager is xfce and Ive configured this and made a zip of it
#Binary downloads from github sucks, so clone the repository instead.


git clone https://github.com/DeuxEx/voidlinux

bash voidlinux/after_install.sh g


#Enable flatpak repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


#setup the xfce4 the way I want it
unzip -o voidlinux/xfce_settings_rev1.zip


#how i created the zip
#zip xfce_settings_rev1.zip .config/xfce4/xfconf/xfce-perchannel-xml/*
#show content
#ls -l .config/xfce4/xfconf/xfce-perchannel-xml/




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



#backing up:
#Core Configs & Services:
sudo tar -czvf etc_backup_$(date +%F).tar.gz /etc /var/service

#User Dotfiles:
tar -czvf home_configs_$(date +%F).tar.gz ~/.bashrc ~/.config /home/void/.local/share/applications

# List all manually installed packages pipe inside a textfile
xbps-query -m > installed_packages.txt
# To reinstall:
# sudo xbps-install -S -R repo-main.voidlinux.org -r <your-arch> $(cat installed_packages.txt)
#dry-run
xbps-install --dry-run $(cat installed_packages.txt)



# Set up bluetooth autostart
sudo ln -s /etc/sv/bluetoothd /var/service/

# Set up ACPI
sudo ln -s /etc/sv/acpid/ /var/service/
sudo sv enable acpid
sudo sv start acpid




# Install GPU drivers
install_gpu_driver() {
  gpu_driver=""
  case "$(lspci | grep -E 'VGA|3D')" in
    *Intel*) gpu_driver="mesa-dri intel-video-accel vulkan-loader mesa-vulkan-intel" ;;
    *AMD*)   gpu_driver="mesa-dri mesa-vaapi mesa-vdpau vulkan-loader mesa-vulkan-radeon" ;;
    *NVIDIA*)gpu_driver="mesa-dri nvidia nvidia-libs-32bit" ;;
  esac
  for pkg in $gpu_driver; do
    [ -n "$pkg" ] && sudo xbps-install -y "$pkg"
  done
}

install_gpu_driver



#install rustdesk flatpak, and do this for making it autostarting
[root@void-deux-640g10 void]# ls /var/lib/flatpak/exports/share/applications/
com.rustdesk.RustDesk.desktop  mimeinfo.cache
[root@void-deux-640g10 void]# mkdir -p ~/.config/autostart
[root@void-deux-640g10 void]# ln -s /var/lib/flatpak/exports/share/applications/com.rustdesk.RustDesk.desktop ~/.config/autostart/
[root@void-deux-640g10 void]# ls -l ~/.config/autostart
total 4
lrwxrwxrwx 1 root root 73 Dec 20 19:45 com.rustdesk.RustDesk.desktop -> /var/lib/flatpak/exports/share/applications/com.rustdesk.RustDesk.desktop
[root@void-deux-640g10 void]# 













