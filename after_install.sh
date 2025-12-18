
myArray=(

#[root@deux-void-840g6 void]# xbps-query -m
alsa-pipewire
alsa-plugins-pulseaudio
alsa-ucm-conf
base-system
batsignal
brltty
chrony
cryptsetup
dejavu-fonts-ttf
dialog
emacs
firefox
flatpak
font-misc-misc
git
gnome-keyring
gnome-themes-standard
gparted
grub-i386-efi
grub-x86_64-efi
guvcview
gvfs-afc
gvfs-mtp
gvfs-smb
htop
inetutils-telnet
lightdm
lightdm-gtk-greeter
lvm2
mc
mdadm
nano
network-manager-applet
orca
picocom
pipewire
seatd
setxkbmap
sof-firmware
syncthing
syncthingtray
terminus-font
tmux
udisks2
void-docs-browse
void-live-audio
void-repo-nonfree
xauth
xfce4
xfce4-battery-plugin
xfce4-pulseaudio-plugin
xorg
xorg-input-drivers
xorg-minimal
xorg-video-drivers
#nvidia
)

for str in ${myArray[@]}; do   echo $str;xbps-install $str; done

