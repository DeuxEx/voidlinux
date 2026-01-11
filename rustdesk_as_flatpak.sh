
#install rustdesk flatpak, and do this for making it autostarting
ls /var/lib/flatpak/exports/share/applications/
#com.rustdesk.RustDesk.desktop  mimeinfo.cache

mkdir -p ~/.config/autostart
ln -s /var/lib/flatpak/exports/share/applications/com.rustdesk.RustDesk.desktop ~/.config/autostart/
ls -l ~/.config/autostart
#com.rustdesk.RustDesk.desktop -> /var/lib/flatpak/exports/share/applications/com.rustdesk.RustDesk.desktop


sudo sv enable rustdesk
sudo ln -s /etc/sv/rustdesk /etc/runit/runsvdir/sv/

sudo sv start rustdesk
