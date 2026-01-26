
# update xbps
xbps-install -u xbps 
# update system 
#xbps-install -Suv


myArray=(
void-repo-nonfree
void-repo-multilib
void-repo-multilib-nonfree
mugshot
neovim
alsa-pipewire
alsa-plugins-pulseaudio
alsa-ucm-conf
batsignal
brltty
chrony
cryptsetup
dejavu-fonts-ttf
dialog
emacs
fastfetch
firefox
flatpak
font-misc-misc
git
gnome-keyring
gnome-themes-standard
gparted
gvfs-afc
gvfs-mtp
gvfs-smb
htop
inetutils-telnet
intel-ucode
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
terminus-font
tmux
udisks2
void-docs-browse
void-live-audio
xauth
xfce4
xfce4-battery-plugin
xfce4-pulseaudio-plugin
xfce4-alsa-plugin
xfce4-whiskermenu-plugin
xorg
xorg-input-drivers
xorg-minimal
xorg-video-drivers
zip
unzip
#rsClock
#steam
#base-system
#curl
#grub-i386-efi
#grub-x86_64-efi
#syncthing
#syncthingtray
#wget
#nvidia
#guvcview
)

for str in ${myArray[@]}; do   echo $str;xbps-install -y $str; done

