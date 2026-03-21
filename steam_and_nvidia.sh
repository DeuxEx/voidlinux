

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


#nvidia install and nvidia dependencies
sudo xbps-install nvidia nvidia-libs-32bit nvidia-opencl nvidia-docker vulkan-loader vulkan-loader-32bit Vulkan-Headers Vulkan-Tools libspa-vulkan libspa-vulkan-32bit ocl-icd ocl-icd-32bit nvidia-vaapi-driver


#steam install and steam dependencies
xbps-install steam
xbps-install -S libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit


