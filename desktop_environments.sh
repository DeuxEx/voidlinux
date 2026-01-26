
#Here is a list of which desktop environments are installable and how to install them:

#GNOME:
xbps-install gnome-core gnome-console gnome-text-editor firefox loupe celluloid ffmpegthumbs file-roller

#KDE:
xbps-install kde-plasma dolphin konsole firefox kdegraphics-thumbnailers ffmpegthumbs vlc ark kwrite

#Cinnamon:
xbps-install lightdm lightdm-gtk3-greeter cinnamon gnome-keyring colord gnome-terminal gvfs-afc gvfs-mtp gvfs-smb udisks2 firefox engrampa mousepad

#XFCE:
xbps-install lightdm lightdm-gtk3-greeter xfce4 gnome-themes-standard gnome-keyring network-manager-applet gvfs-afc gvfs-mtp gvfs-smb udisks2 firefox xfce4-pulseaudio-plugin engrampa mousepad

#MATE:
xbps-install lightdm lightdm-gtk3-greeter mate mate-extra gnome-keyring network-manager-applet gvfs-afc gvfs-mtp gvfs-smb udisks2 firefox engrampa pluma

#LXQt:
# good to user if xfce fails, this is more lightweight:
xbps-install lxqt sddm gvfs-afc gvfs-mtp gvfs-smb udisks2 firefox nm-tray pcmanfm-qt FeatherPad qterminal
