
Cannot login to xfce and no network

Write your ssid and passphrase into the default conf:

wpa_passphrase "MYSSID" "passphrase" >> /etc/wpa_supplicant/wpa_supplicant.conf

Enable the necessary services:
ln -s /etc/sv/wpa_supplicant /var/service
ln -s /etc/sv/dhcpcd /var/service


Run the services:
sv -v up wpa_supplicant
sv -v up dhcpcd

