
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




#To autostart RustDesk on Void Linux, use its built-in service for X11 with
sudo sv enable rustdesk and sudo ln -s /etc/sv/rustdesk /etc/runit/runsvdir/sv/, then ensure you're using X11, not Wayland, as Wayland often breaks autostart;
alternatively, for user-level autostart in your desktop environment, create a .desktop file in ~/.config/autostart/ for GUI launches, but the rustdesk --service method is best for system-wide background access. 

