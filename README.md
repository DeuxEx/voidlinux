#!/bin/sh


 __      ______ _____ _____    _      _____ _   _ _    ___   __
 \ \    / / __ \_   _|  __ \  | |    |_   _| \ | | |  | \ \ / /
  \ \  / / |  | || | | |  | | | |      | | |  \| | |  | |\ V / 
   \ \/ /| |  | || | | |  | | | |      | | | . ` | |  | | > <  
    \  / | |__| || |_| |__| | | |____ _| |_| |\  | |__| |/ . \ 
     \/   \____/_____|_____/  |______|_____|_| \_|\____//_/ \_\
                                                               
                                                               
                                                     

#This is just some notes,configs and reminders for myself on how I install my Void Linux environment.


#First install the computer with a iso from void.

#https://voidlinux.org/download/

#I use glibc base (no window manager)
#musl is for thinner single processing computers without need of GPU and other repositories than the default in xbps.

 __      __     _____  _____          _   _ _______ _____ 
 \ \    / /\   |  __ \|_   _|   /\   | \ | |__   __/ ____|
  \ \  / /  \  | |__) | | |    /  \  |  \| |  | | | (___  
   \ \/ / /\ \ |  _  /  | |   / /\ \ | . ` |  | |  \___ \ 
    \  / ____ \| | \ \ _| |_ / ____ \| |\  |  | |  ____) |
     \/_/    \_\_|  \_\_____/_/    \_\_| \_|  |_| |_____/ 
                                                          
                                                          
                                                   
                                                   
                                         
#glibc base
https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-base.iso
#glibc with xfce
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-xfce.iso
#musl withc xfce
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-musl-20250202-xfce.iso


xbps-install git
git clone https://github.com/DeuxEx/voidlinux


#run the voidlinux/install.sh to install some good applications and routines, like htop, telnet, mc etc
bash voidlinux/after_install.sh g

  ______ _            _______ _____        _  __
 |  ____| |        /\|__   __|  __ \ /\   | |/ /
 | |__  | |       /  \  | |  | |__) /  \  | ' / 
 |  __| | |      / /\ \ | |  |  ___/ /\ \ |  <  
 | |    | |____ / ____ \| |  | |  / ____ \| . \ 
 |_|    |______/_/    \_\_|  |_| /_/    \_\_|\_\
                                                
                                                
                                                                    
#Enable flatpak repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#flatpak install rustdesk
#flatpak install opera

 __   ________ _____ ______ 
 \ \ / /  ____/ ____|  ____|
  \ V /| |__ | |    | |__   
   > < |  __|| |    |  __|  
  / . \| |   | |____| |____ 
 /_/ \_\_|    \_____|______|
                            
                            
                                                               
#If using xfce Ive configured the activity-bar and made a zip of it
#unzip -o voidlinux/xfce_settings_rev2.zip
#how i created the zip, -r = recurse
#zip -r xfce_settings_rev2.zip .config/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/ ~/.bashrc ~/.bash_profile /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml /etc/skel/.bashrc /etc/skel/.bash_profile ~/.inputrc /home/void/.config/xfce4/panel/launcher-*

   _____ _____ _   _ _   _          __  __  ____  _   _ 
  / ____|_   _| \ | | \ | |   /\   |  \/  |/ __ \| \ | |
 | |      | | |  \| |  \| |  /  \  | \  / | |  | |  \| |
 | |      | | | . ` | . ` | / /\ \ | |\/| | |  | | . ` |
 | |____ _| |_| |\  | |\  |/ ____ \| |  | | |__| | |\  |
  \_____|_____|_| \_|_| \_/_/    \_\_|  |_|\____/|_| \_|
                                                        
                                                        
                                            
if using cinnamon (which I do) ive backed up my settings here:
#tar -czvf cinnamon_config_backup.tar.gz ~/.cinnamon ~/.local/share/cinnamon ~/.config/cinnamon /home/void/.local/share/cinnamon/
#untar -xvf cinnamon_config_backup.tar.gz

  _   _          _   _  ____  
 | \ | |   /\   | \ | |/ __ \ 
 |  \| |  /  \  |  \| | |  | |
 | . ` | / /\ \ | . ` | |  | |
 | |\  |/ ____ \| |\  | |__| |
 |_| \_/_/    \_\_| \_|\____/ 
                              
                              

#create tarball with my nano-settings
#tar -czvf nano-settings.tar /etc/nanorc /root/.nano/
#untar
tar -xvf nano-settings.tar




