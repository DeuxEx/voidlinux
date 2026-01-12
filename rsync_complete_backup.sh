
#install rsync
sudo xbps-install rsync

#we want to backup completely minus tempfiles, to a ext4 partition usb drive:

#list blockdevices
lsblk

#partition the usb
cfdisk /dev/sdb

#create a ext filesystem
mkfs.ext4 /dev/sdb
  
#list blockdevices with UUID
lsblk -f

#dismount the usb device
umount 6036fd6f-ee36-4a99-8eda-f1bc14e96460
umount /dev/sdb

#re-label the usb device to BACKUP
e2label /dev/sdb "BACKUP"

#check for the device presence in fstab
nano /etc/fstab 

#re-mount the device
mount -a

#start the backup with rsync, with some options and excludes and last the destination
sudo rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /run/media/void/BACKUP/

















sent 11,948,436,097 bytes  received 2,706,120 bytes  5,265,980.27 bytes/sec
total size is 11,933,882,838  speedup is 1.00



