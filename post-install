#!/bin/env bash
# This script is licensed under the MIT License.
# Copyright (c) 2026 Luca Gödde
## author: Gödde, Luca
## date 21.02.2026
## desc: This script helps the user to setup their fresh Void Linux install with the neccasitys like audio
set -euo pipefail
shopt -s extglob

###-----------###
##  VARIABLES  ##
###-----------###

voidRepoPath="${HOME}/void-repo"
voidRepoURL="https://github.com/void-linux/void-packages.git"

###-----------###
##  CONSTANTS  ##
###-----------###

PACKAGES=(
	socklog-void
	cronie
	chrony
	elogind
	tlp
	network-manager-applet
	xorg
	mesa-dri
	noto-fonts-ttf
	noto-fonts-cjk
	noto-fonts-emoji
	nerd-fonts
	pipewire
	pulseaudio-utils
	pavucontrol-qt
	libspa-bluetooth
	alsa-pipewire
	bluez
	python3-devel
	python3-dbus
	lua-devel
	openjdk21-jre
	openjdk25-jre
	nodejs
	gcc
	fzf
	xdg-utils
	xdg-user-dirs
	cups
	cups-filters
	avahi
	nss-mdns
	system-config-printer
	cups-pk-helper
	libvirt
	polkit
	virt-manager
	virt-manager-tools
	qemu
    mc
    nano
    vsv
)

PACKAGES_INTEL=(
	intel-ucode
	linux-firmware-intel
	mesa-dri
	vulkan-loader
	mesa-vulkan-intel
	intel-video-accel
)

PACKAGES_AMD=(
	linux-firmware-amd
	mesa-dri
	vulkan-loader
	mesa-vulkan-radeon
	amdvlk
	xf86-video-amdgpu
	mesa-vaapi
	libvdpau
)

# Colors
NORMAL="\033[0m"
GREEN="\e[32m"
PINK="\e[1;35m"
RED="\e[31m"
CYAN="\e[36m"
BLUE="\033[1;34m"
YELLOW="\e[1;33m"
BACKGROUND="\e[30;47m"

###-------###
##  REGEX  ##
###-------###

REGEX_YES="[yY]"
REGEX_NO="[nN]"
REGEX_QUIT="[qQ]"

###------------------###
##  HELPER FUNCTIONS  ##
###------------------###

# Function to ask the user if they accept whatever is prompted
ask_yn() {
	local prompt="$1"

	printf "%b%s%b\n" "${CYAN}" "${prompt}" "${NORMAL}"

	PS3='Please choose: '
	select answer in "YES" "NO" "ABORT"; do
		case "${answer}" in
		"YES") return 0 ;;
		"NO") return 1 ;;
		"ABORT") exit 1 ;;
		*) printf "%bNot a valid input.%b\n" "${YELLOW}" "${NORMAL}" ;;
		esac
	done
	PS3=''
}

# Function to runs command in a more verbose way and handles if the command fails
run_command() {
	local commandString
	commandString="$(echo -e -n "$@")"

	printf "%b%s%b is running...\n%b" "${PINK}" "${commandString}" "${NORMAL}${CYAN}" "${NORMAL}"
	if ! "$@"; then
		printf "%bERROR: %s%b\n" "${RED}" "$*" "${NORMAL}"
		return 1
	fi
}

###----------------###
##  MAIN FUNCTIONS  ##
###----------------###

# checks if the script was run as superuser
check_if_root() {
	clear
	if [[ "$(id -u)" -eq 0 ]]; then
		printf "%bPlease don't run this script as root so it can add your user to the diffrent groups.%b\n" "${YELLOW}" "${NORMAL}"
		return 1
	fi
}

# Lets the user change their default mirror for faster downloads
# TODO: write a seprate method to do this so no flash bang
change_mirrors() {
	clear
	if ! ask_yn "Do you want to change the default mirror"; then
		return 0
	fi

	sudo xmirror
}

# Installs all packages in the PACKAGES Array
install_base_packages() {
	clear
	local package
	for package in "${PACKAGES[@]}"; do
		echo "${package}"
	done
	if ! ask_yn "Do you want to install these packages"; then
		return 0
	fi

	run_command sudo xbps-install -Suvy "${PACKAGES[@]}"
}

# Install the respective firmware packages for either amd or intel
install_firmware() {
	clear
	local package
	if grep -m 1 "model name" /proc/cpuinfo | grep --ignore-case "intel"; then
		for package in "${PACKAGES_INTEL[@]}"; do
			echo -e -n "${package}"
		done
		printf "%bInstalling the above packages for intel hardware support.%b\n" "${CYAN}" "${NORMAL}"
		run_command sudo xbps-install -Suvy "${PACKAGES_INTEL[@]}"
	elif grep -m 1 "model name" /proc/cpuinfo | grep --ignore-case "amd"; then
		for package in "${PACKAGES_AMD[@]}"; do
			echo -e -n "${package}"
		done
		printf "%bInstalling the above packages for amd hardware support.%b\n" "${CYAN}" "${NORMAL}"
		run_command sudo xbps-install -Suvy "${PACKAGES_AMD[@]}"
	fi
}

# This  will enable the services for syslog and add the user to the group
enable_logging() {
	clear
	printf "%bEnabling logging services and adding user to the group.%b\n" "${CYAN}" "${NORMAL}"
	sudo ln -sf /etc/sv/socklog-unix /var/service
	sudo ln -sf /etc/sv/nanoklogd /var/service

	sudo usermod -aG socklog "${USER}"
}

# Enable the required service for the cronie
enable_cronie() {
	clear
	printf "%bEnabling the cronie services.%b\n" "${CYAN}" "${NORMAL}"

	sudo ln -sf /etc/sv/cronie /var/service
}

# Enable ntp services
enable_ntp() {
	clear
	printf "%bEnabling the chronyd services.%b\n" "${CYAN}" "${NORMAL}"

	sudo ln -sf /etc/sv/chronyd /var/service
}

# Enable power management services (i.e. tlp)
enable_powermanagement() {
	clear
	printf "%bEnable the elogind and tlp service and disable acpid.%b" "${CYAN}" "${NORMAL}"

	if [[ -e "/var/service/acpid" ]]; then
		rm -r /var/service/acpid
	fi

	sudo ln -sf /etc/sv/elogind /var/service
	sudo ln -sf /etc/sv/tlp /var/service
}

# Setting up audio
configure_audio() {
	clear
	printf "%bEnable audio with pipewire, pipewire-pulse and alsa.%b\n" "${CYAN}" "${NORMAL}"

	# For pipewire and pulseaudio support
	sudo mkdir -p /etc/pipewire/pipewire.conf.d

	sudo ln -sf /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
	sudo ln -sf /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

	# For alsa support
	sudo mkdir -p /etc/alsa/conf.d
	sudo ln -sf /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
	sudo ln -sf /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d

	# Setup autostart for some desktop environment
	sudo ln -sf /usr/share/applications/pipewire.desktop /etc/xdg/autostart/
}

# Enable bluetooth support
enable_bluetooth() {
	clear
	printf "%bEnable bluetoothd service and adding the user to the group.%b\n" "${CYAN}" "${NORMAL}"

	sudo ln -sf /etc/sv/bluetoothd /var/service

	sudo usermod -aG bluetooth "${USER}"
}

# Enable printing
enable_printing() {
	clear
	printf "%bEnable the necessary services to enable printing support.%b\n" "${CYAN}" "${NORMAL}"

	sudo ln -sf /etc/sv/cupsd /var/service
	sudo ln -sf /etc/sv/avahi-daemon /var/service

	sudo usermod -aG lpadmin "${USER}"
}

# Adding user to other groups
adding_groups() {
	clear
	printf "%bAdding the user to other groups not required in steps above.%b\n" "${CYAN}" "${NORMAL}"

	sudo usermod -aG libvirt "${USER}"
}

# Setting up the community's inoffical void-repo
settingup_void-repo() {
	local customPath customURL
	clear
	if ! ask_yn "Do you want to setup the inoffical void-repo"; then
		return 0
	fi

	if ! ask_yn "The repository will be installed at ${voidRepoPath}. Do you agree with that location"; then
		clear
		while true; do
			printf "%bPlease enter a custom path (absolute path only) where you want to install the repository into.\n The location needs to be somewhere that your user has permision to edit: %b" "${CYAN}" "${NORMAL}"
			read -r customPath

			if [[ -e "${customPath}" ]] && [[ -n $(ls -A "${customPath}") ]]; then
				printf "%bDirectory is not empty. Please choose another one.%b\n" "${YELLOW}" "${NORMAL}"
				continue
			fi

			if ! ask_yn "Is this the path (${customPath}) you want to use (If it dosen't exist it will be created.)"; then
				continue
			fi

			if ! [[ -e "${customPath}" ]]; then
				mkdir -p "${customPath}"
			fi
			voidRepoPath="${customPath}"
			break
		done

	fi

	if ask_yn "Do you have a custom fork of void-repo"; then
		while true; do
			clear
			printf "%bPlease enter the url of the custom fork: %b" "${CYAN}" "${NORMAL}"
			read -r customURL

			if ! GIT_TERMINAL_PROMPT=0 git ls-remote "${customURL}" | wc -l &>/dev/null; then
				printf "%bPlease enter a valid repository.%b\n" "${YELLOW}" "${NORMAL}"
				continue
			fi

			if ! ask_yn "Is this ${customURL} the repository you want to use"; then
				continue
			fi

			voidRepoURL="${customURL}"
			break
		done
	fi

	clear

	printf "%bCloning the repoistory...%b\n" "${CYAN}" "${NORMAL}"
	git clone "${voidRepoURL}" "${voidRepoPath}"

	printf "%bEnabling restricted packages.%b\n" "${CYAN}" "${NORMAL}"
	echo "XBPS_ALLOW_RESTRICTED=yes" >>"${voidRepoPath}"/etc/conf
}

# generate the user directorys, removes this script and
# prompts the user to reboot the system
finish_post_installation() {
	clear

	xdg-user-dirs-update

	printf "%bPost installation completed. It is recommended that you reboot your computer.%b\n" "${CYAN}" "${NORMAL}"
	if ask_yn "Do you want to reboot"; then
		printf "%bRemoving the script from the script...%b\n" "${CYAN}" "${NORMAL}"
		rm ./post-install
		sudo reboot
	fi
}

main() {
	check_if_root
	change_mirrors
	install_base_packages
	install_firmware
	enable_logging
	enable_cronie
	enable_ntp
	enable_powermanagement
	configure_audio
	enable_bluetooth
	enable_printing
	adding_groups
	settingup_void-repo
	finish_post_installation
}

main
