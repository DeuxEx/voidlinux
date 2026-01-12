
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






#how to restore the backup data
#boot inte a void live-USB/ISO

sudo mount /dev/sdX1 /mnt         # Mount your new root partition
sudo mkdir -p /mnt/backup
sudo mount /dev/sdY1 /mnt/backup # Mount your backup drive

# Example: If you backed up with: sudo rsync -aAX --delete / /mnt/backup/
# Restore with:
sudo rsync -aAX --delete /mnt/backup/ /mnt/

for i in /dev /proc /sys; do sudo mount --bind $i /mnt$i; done # Bind essential dirs
sudo chroot /mnt

# Inside chroot:
grub-install /dev/sdX # Install GRUB to the correct disk (not partition)
grub-mkconfig -o /boot/grub/grub.cfg # Generate grub config
exit # Exit chroot

# Find your old UID/GID from backup (e.g., find /mnt/backup -user 1000)
# Replace 1000 with your actual old ID, newuser with your new username
sudo find /mnt -user 1000 -exec chown newuser:newgroup {} +

# Unmount in reverse order from /mnt/backup to /mnt
sudo umount /mnt/backup
sudo umount /mnt
reboot









#backup data information
#sent 11,948,436,097 bytes  received 2,706,120 bytes  5,265,980.27 bytes/sec
#total size is 11,933,882,838  speedup is 1.00



