

# Install GPU drivers
install_gpu_driver() {
  gpu_driver=""
  case "$(lspci | grep -E 'VGA')" in
    *Intel*) gpu_driver="mesa-dri intel-video-accel vulkan-loader mesa-vulkan-intel" ;;
    *AMD*)   gpu_driver="mesa-dri mesa-vaapi mesa-vdpau vulkan-loader mesa-vulkan-radeon" ;;
    *NVIDIA*)gpu_driver="mesa-dri nvidia nvidia-libs-32bit" ;;
  esac
  for pkg in $gpu_driver; do
    [ -n "$pkg" ] && sudo xbps-install -y "$pkg"
  done
}

install_gpu_driver

#To install the driver, simply install the void-repo-nonfree package, synchronize the repos with sudo xbps-install -Su and then install the appropriate version of the driver:

#nvidia for GTX 750 Ti (<3), 800 series and above
#nvidia470 for 600 and 700 series
#nvidia390 for 400 and 500 series


Steam

I’ve mentioned Steam before so i will mention it again for those who installed ‘Local’

You first enable multilib, nonfree and multilib-nonfree repositories by installing the 
void-repo-nonfree 
void-repo-multilib 
void-repo-multilib-nonfree
packages, 
then sync the repos with sudo xbps-install -S, and then you can just install the steam package. I’m not entirely sure if the multilib repos are needed but just in case.


xbps-install steam
xbps-install -S libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit
