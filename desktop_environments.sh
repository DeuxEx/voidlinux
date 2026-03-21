
#Here is a list of which desktop environments are installable and how to install them:

#GNOME:
xbps-install gnome-core gnome-console gnome-text-editor loupe celluloid ffmpegthumbs file-roller

#KDE:
xbps-install kde-plasma dolphin konsole kdegraphics-thumbnailers ffmpegthumbs vlc ark kwrite

#Cinnamon:
xbps-install lightdm lightdm-gtk3-greeter cinnamon gnome-keyring colord gnome-terminal gvfs-afc gvfs-mtp gvfs-smb udisks2 engrampa mousepad

#XFCE:
xbps-install lightdm lightdm-gtk3-greeter xfce4 gnome-themes-standard gnome-keyring network-manager-applet gvfs-afc gvfs-mtp gvfs-smb udisks2 xfce4-pulseaudio-plugin engrampa mousepad

#MATE:
xbps-install lightdm lightdm-gtk3-greeter mate mate-extra gnome-keyring network-manager-applet gvfs-afc gvfs-mtp gvfs-smb udisks2 engrampa pluma

#LXQt:
# good to user if xfce fails, this is more lightweight:
xbps-install lxqt sddm gvfs-afc gvfs-mtp gvfs-smb udisks2 firefox nm-tray pcmanfm-qt FeatherPad qterminal

#KDE Plasma
xbps-install Vulkan-Headers Vulkan-Tools dbus-elogind elogind kde-baseapps kde-plasma libdrm-32bit libgcc-32bit libglvnd-32bit libspa-vulkan-32bit libstdc++-32bit libva-32bit
xbps-install lightdm mesa-dri-32bit mesa-opencl mesa-opencl-32bit mesa-vaapi-32bit mesa-vulkan-intel mesa-vulkan-intel-32bit mutter ocl-icd-32bit plasma-browser-integration
xbps-install plasma-desktop plasma-wayland-protocols qt6-wayland seatd setxkbmap wayland-utils xdg-desktop-portal-gtk xdg-user-dirs-gtk xf86-video-intel xorg-fonts xorg-minimal xtools



