

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



echo "Installing 2D Xorg accelaration packages"
sudo xbps-install -Sy xf86-video-intel


echo "Installing 3D accelaration packages"
sudo xbps-install -Syu mesa-dri mesa-opencl gamemode mesa-vulkan-intel vulkan-loader Vulkan-Headers Vulkan-Tools ocl-icd


echo "Installing Video accelaration packages"
sudo xbps-install -Syu mesa-vaapi mesa-vdpau intel-video-accel libspa-vulkan libva


echo "Installing 32bit 3D accelaration packages, Will fail on Musl"
sudo xbps-install -Syu mesa-dri-32bit mesa-opencl-32bit mesa-vulkan-intel-32bit vulkan-loader-32bit ocl-icd-32bit libgamemode-32bit mesa-vulkan-nouveau-32bit


echo "Installing 32bit Video accelaration packages, Will fail on Musl"
sudo xbps-install -Sy mesa-vaapi-32bit mesa-vdpau-32bit libspa-vulkan-32bit libva-32bit


echo "nvidia install and nvidia dependencies"
sudo xbps-install nvidia nvidia-libs-32bit nvidia-opencl nvidia-docker vulkan-loader vulkan-loader-32bit Vulkan-Headers Vulkan-Tools libspa-vulkan libspa-vulkan-32bit ocl-icd ocl-icd-32bit nvidia-vaapi-driver


echo "steam install and steam dependencies"
xbps-install steam
xbps-install -S libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit

echo "my personal setup for wayland with two monitors, using HDMI1-port"
echo "KDE cannot send higher resolutions to screens (via kwin rules) than 1080p, so we need to install gamescope (from steam manufactorers)"
xbps-install gamescope

echo "in the steam klient use this start options"
echo "gamescope defaults to US language, change to swedish by using: XKB_DEFAULT_LAYOUT=se"
echo "--force-grab-cursor gets rid of the mousebug when rightclicking and the game goes to the default view, this locks the game and only way to unlock it is to press the Windows/Super key"
echo "the rest is which resolutions i need the game to run in"
XKB_DEFAULT_LAYOUT=se gamescope -w 2560 -h 1440 -W 2560 -H 1440 -b -O HDMI-A-1 --force-grab-cursor -- %command%


