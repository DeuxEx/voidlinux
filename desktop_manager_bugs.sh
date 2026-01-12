#Troubleshooting

#if you have no desktop manager starting up , try:
login
sudo
exec startxfce4

#lightdm:
#enable service:
sudo ln -s /etc/sv/lightdm /var/service/
sudo sv status lightdm
#if fxce4 fails, try lxdm
sudo xbps-install -S lxdm
sudo ln -s /etc/sv/lxdm /var/service/
#disable lightdm
sudo rm /var/service/lightdm
