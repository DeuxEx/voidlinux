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





# Set up bluetooth autostart
sudo ln -s /etc/sv/bluetoothd /var/service/

# Set up ACPI
sudo ln -s /etc/sv/acpid/ /var/service/
sudo sv enable acpid
sudo sv start acpid







#Create a Custom Service

# Create service directory
mkdir -p /etc/sv/myapp

# Create the run script
cat > /etc/sv/myapp/run << 'EOF'
#!/bin/sh
exec chpst -u myapp:myapp /usr/bin/python3 /opt/myapp/app.py 2>&1
EOF

# Make it executable
chmod +x /etc/sv/myapp/run

# Create log service
mkdir -p /etc/sv/myapp/log
cat > /etc/sv/myapp/log/run << 'EOF'
#!/bin/sh
exec svlogd -tt /var/log/myapp
EOF
chmod +x /etc/sv/myapp/log/run

# Enable the service
ln -s /etc/sv/myapp /var/service/






#To see enabled services for "current" runlevel:
ls -l /var/service/

#To see available runlevels (default and single, which just runs sulogin):
ls -l /etc/runit/runsvdir

#To enable and start a service into the "current" runlevel:
ln -s /etc/sv/<service> /var/service

#To disable and remove a service:
rm -f /var/service/<service>

#To view status of all services for "current" runlevel:
sv status /var/service/*
