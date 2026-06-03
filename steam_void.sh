

Installing Steam natively on Void Linux requires enabling the nonfree and multilib repositories, as most Steam dependencies (especially 32-bit libraries and graphics drivers) reside there.


Step 1: Enable the Required Repositories
Open your terminal and enable the nonfree and multilib repositories with the following commands:

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S



Step 2: Install Steam
Once your repositories are updated, install the native Steam package:

sudo xbps-install -S steam



Step 3: Install Essential 32-Bit Libraries & Drivers
Because Void Linux doesn't blindly install all hardware drivers, you will need to manually install the 32-bit libraries corresponding to your graphics card.
Run this command to grab the standard 32-bit packages for runtime and audio:

sudo xbps-install -S libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-32bit vulkan-loader mesa-dri-32bit libsecret-32bit



You must also install your specific GPU's 32-bit drivers:

For NVIDIA: 
sudo xbps-install -S nvidia-libs-32bit

For AMD: 
sudo xbps-install -S mesa-dri-32bit mesa-vulkan-radeon-32bit amdvlk-32bit



(Note: You can view all extra dependency recommendations anytime after installing by reading the local file at /usr/share/doc/steam/README.voidlinux).


Step 4: Setup Game Controllers 
(Optional)
If you are using game controllers (such as a PlayStation or Xbox controller), it is highly recommended to install the steam-devices package to ensure udev rules correctly detect your hardware:

sudo xbps-install -S steam-devices

