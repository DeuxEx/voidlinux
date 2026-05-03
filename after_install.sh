
# update xbps
xbps-install -u xbps 
# update system 
#xbps-install -Suv


myArray=(
NetworkManager
alsa-plugins-pulseaudio
alsa-tools
base-system
btop
chrony
cryptsetup
dbus-elogind
dialog
elogind
fastfetch
filelight
firefox
htop
kcalc
kde-baseapps
kde-plasma
kolourpaint
libspa-vulkan-32bit
libva-32bit
lvm2
mc
mdadm
mesa-dri-32bit
mesa-opencl
mesa-opencl-32bit
mesa-vaapi-32bit
mesa-vulkan-intel
mesa-vulkan-intel-32bit
metalog
mutter
nano
nvtop
plasma-browser-integration
plasma-desktop
plasma-wayland-protocols
qt6-wayland
sddm
sox
spectacle
vivaldi
void-docs-browse
void-live-audio
void-repo-multilib
void-repo-multilib-nonfree
void-repo-nonfree
vsv
wayland-utils
weston
wireplumber
xdg-desktop-portal-gtk
xdg-user-dirs-gtk
xf86-video-intel
xorg-minimal
xtools
)

for str in ${myArray[@]}; do   echo $str;xbps-install -y $str; done

