
# find the nvidia packages in your cache (hopefully) or cp them

ls /var/cache/xbps/nvidia*
xdowngrade /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps

# add the found files into the index to be used later on
xbps-rindex -a /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.xbps
xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-gtklibs-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-dkms-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-firmware-580.105.08_1.x86_64.xbps
# index: 6 packages registered.

# now start the installations and the dependencies in the index will list up and install
xbps-install -R /var/cache/xbps/ -f nvidia-580.105.08_1


#Name            Action    Version           New version            Download size
#nvidia-libs     downgrade 580.119.02_1      580.105.08_1           - 
#nvidia-gtklibs  downgrade 580.119.02_1      580.105.08_1           - 
#nvidia-dkms     downgrade 580.119.02_1      580.105.08_1           - 
#nvidia-firmware downgrade 580.119.02_1      580.105.08_1           - 
#nvidia          install   -                 580.105.08_1           - 

#Size required on disk:         895MB
#Space available on disk:        84GB

#[*] Verifying package integrity
#[*] Collecting package files
#[*] Unpacking packages
#[*] Configuring unpacked packages
#Updating MIME database...
#nvidia-580.105.08_1: installed successfully.

#0 downloaded, 1 installed, 4 updated, 5 configured, 0 removed, 0 on hold.



# xbps-pkgdb -m hold <package>
xbps-rindex -a /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.xbps
xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-gtklibs-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-firmware-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-dkms-580.105.08_1.x86_64.xbps


#query for the package locally so we get the name handle
xbps-query nvidia


#To prevent a package from being updated during a system update, use xbps-pkgdb(1):


# put the packages on hold, so we dont by mistake install the new versions over again
# xbps-pkgdb -m unhold <package>

xbps-pkgdb -m hold nvidia-580.105.08_1 nvidia nvidia-dkms nvidia-firmware nvidia-gtklibs nvidia-libs

# the hold can be unhold in the future when there are a new stable version thats working


