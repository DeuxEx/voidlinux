#!/usr/bin/env bash
# This script is licensed under the MIT License.
# Copyright (c) 2026 Luca Gödde
## author: Gödde, Luca
## project: Void Linux install script
## desc: An attempt to automate the install process of Void Linux (chroot environment)
## date: 2026-03-08
## updated: 2026-03-08

set -euo pipefail # Enable errorhandling
shopt -s extglob  # Enable whitespace trimming

#=============#
#  VARIABLES  #
#=============#

resumeUUID=""
resumeOffset=""
efiUUID=""
bootUUID=""
rootUUID=""
luksUUID=""
selectedShell=""

#=============#
#  CONSTANTS  #
#=============#

LOCALES_FILE="/etc/default/libc-locales"
RAM_SIZE="$(free -g --si | awk -F " " 'FNR == 2 {print $2}')"

# REGEX:

REGEX_STRING="[a-zA-Z]"
REGEX_QUIT="[qQ][uU][iI][tT]"

#==========#
#  COLORS  #
#==========#

NORMAL="\033[0m"
GREEN="\e[32m"
PINK="\e[1;35m"
RED="\e[31m"
CYAN="\e[36m"
BLUE="\033[1;34m"
YELLOW="\e[1;33m"

#===========#
#  CLEANUP  #
#===========#

# Cleans up the environment when something fails
cleanup() {
    printf "%bCleaning up...%b\n" "${YELLOW}" "${NORMAL}"
}
trap cleanup EXIT

#====================#
#  HELPER FUNCTIONS  #
#====================#

# Prompts the user if they agree to the question
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

# Runs commands in a more verbose way and handles errors better
run_command() {
    local commandString
    commandString="$(echo -e -n "$@")"

    printf "%b%s%b is running...\n%b" "${PINK}" "${commandString}" "${NORMAL}${CYAN}" "${NORMAL}"
    if ! "$@"; then
        printf "%bERROR: %s%b\n" "${RED}" "$*" "${NORMAL}"
        return 1
    fi
}

# Checks if the system is connected to the internet
isOnline() {
    if ping -c 2 8.8.8.8 &>/dev/null; then
        return 0
    else
        return 1
    fi
}

#==================#
#  MAIN FUNCTIONS  #
#==================#

# Sets a password for the superuser and change it's shell to bash
# Also sets the folder permission of the root folder so only the superuser has full access
# Enables sudo rights to member of the wheel group
set_permissions() {
    clear
    while true; do
        clear
        printf "%bEnter a password for the superuser (root): %b\n" "${CYAN}" "${NORMAL}"
        if passwd root; then
            break
        else
            printf "%bSomething went wrong. Please try again.%b\n" "${YELLOW}" "${NORMAL}"
        fi
    done

    clear

    printf "%bChanging default shell for the superuser to bash%b\n" "${BLUE}" "${NORMAL}"
    run_command chsh -s /bin/bash root

    clear

    printf "%bSetting root permissions...%b\n" "${BLUE}" "${NORMAL}"
    run_command chown root:root /
    run_command chmod 755 /

    clear

    printf "%bEnabling users of the wheel group to use sudo...%b\n" "${BLUE}" "${NORMAL}"
    echo "%wheel ALL=(ALL) ALL" >/etc/sudoers.d/10-wheel
}

# Prompts the user to select a hostname and create the hosts file
set_hostname() {
    local hostname
    while true; do
        clear
        printf "%bEnter a hostname for your machine: %b" "${CYAN}" "${NORMAL}"
        read -r hostname

        if [[ -z "${hostname}" ]] || ! ask_yn "Is ${hostname} the name you want to use for your machine"; then
            continue
        fi

        echo "${hostname}" >/etc/hostname
        cat <<EOF >/etc/hosts
# 
# /etc/hosts: static lookup table for host names
#
127.0.0.1	localhost
::1			localhost
127.0.0.1	${hostname}.localdomain ${hostname}
EOF
        printf "%bSet hostname to: %b%s%b" "${GREEN}" "${NORMAL}${PINK}" "${hostname}" "${NORMAL}"
        sleep 1
        break
    done
}

# Show all available locales in the libc-locales file and
# prompts the user to select one to uncomment
# Also sets the default language
set_locales() {
    local chosenLine actualLine localesFileLength language
    localesFileLength="$(($(wc -l </etc/default/libc-locales) - 11))"

    while true; do
        clear
        tail -n +11 "${LOCALES_FILE}" | nl -v 0 | less --RAW-CONTROL-CHARS --no-init

        printf "%bEnter the number corresponding to the local you want to use: %b" "${CYAN}" "${NORMAL}"
        read -r chosenLine

        if [[ "${chosenLine}" =~ ${REGEX_STRING} ]]; then
            printf "%bNot a valid input.%b\n" "${YELLOW}" "${NORMAL}"
            continue
        elif [[ "${chosenLine}" -gt "${localesFileLength}" ]]; then
            printf "%bNot a valid input.%b\n" "${YELLOW}" "${NORMAL}"
            continue
        else
            actualLine=$((chosenLine + 11))
            locale=$(sed -n "${actualLine}p" "${LOCALES_FILE}")
            locale="${locale%%*( )}"

            if ! ask_yn "Is this the local you want to use (${locale})"; then
                continue
            fi
            break
        fi
    done

    clear

    if [[ "${locale}" == \#* ]]; then
        run_command sed -i "${actualLine}s/^#//" "${LOCALES_FILE}"
        printf "%bSuccesfully uncommented %b%s%b.%b\n" "${GREEN}" "${NORMAL}${PINK}" "${locale}" "${NORMAL}${GREEN}" "${NORMAL}"
    else
        printf "%bThe selected locale is already uncommented: %b%s%b\n" "${GREEN}" "${PINK}" "${locale}" "${NORMAL}"
    fi

    clear

    language="${locale%%[[:space:]]*}"
    printf "%bSetting the default language to %b%s%b.%b\n" "${GREEN}" "${NORMAL}${PINK}" "${language}" "${NORMAL}${GREEN}" "${NORMAL}"
    echo "LANG=${language#?}" >/etc/locale.conf
    sleep 1

    clear

    printf "%bReconfiguring glibc-loacles...%b\n" "${BLUE}" "${NORMAL}"
    run_command xbps-reconfigure -f glibc-locales
}

# Show all available timezones and prompts the user to select one
# Then sets the choosen timezone
set_timezone() {
    local timezone

    while true; do
        clear
        awk '/^Z/ { print $2 }; /^L/ { print $3 }' /usr/share/zoneinfo/tzdata.zi |
            less --RAW-CONTROL-CHARS --no-init

        printf "%bEnter your timezone (i.e. Europe/Berlin): %b" "${CYAN}" "${NORMAL}"
        read -r timezone

        if ! [[ -f "/usr/share/zoneinfo/${timezone}" ]]; then
            printf "%bNot a valid timezone.%b\n" "${YELLOW}" "${NORMAL}"
            sleep 1
            continue
        fi

        run_command ln -sf /usr/share/zoneinfo/"${timezone}" /etc/localtime
        printf "%bSet timezone to %b%s%b.%b\n" "${GREEN}" "${NORMAL}${PINK}" "${timezone}" "${NORMAL}${GREEN}" "${NORMAL}"
        sleep 1
        break
    done
}

# Creating configuration for dracut:
# Enabling hostonly mode
# Installing neccessary modules
# Setting tempfolder
creating_dracut_config() {
    clear
    printf "%bAdding needed darcut configuration files...%b\n" "${BLUE}" "${NORMAL}"
    sleep 1
    clear

    echo -e -n "hostonly=yes\nhostonly_cmdline=yes" >>/etc/dracut.conf.d/00-hostonly.conf
    if [[ "${isEncrypted}" ]]; then
        printf "%bAdding crypt, btrfs and resume modules to dracut%b\n" "${BLUE}" "${NORMAL}"
        echo -e -n "add_dracutmodules+=\" crypt btrfs resume \"" >>/etc/dracut.conf.d/20-addmodules.conf
    else
        printf "%bAdding trfs and resume modules to dracut%b\n" "${BLUE}" "${NORMAL}"
        echo -e -n "add_dracutmodules+=\" btrfs resume \"" >>/etc/dracut.conf.d/20-addmodules.conf
    fi

    echo -e -n "tmpdir=/tmp" >>/etc/dracut.conf.d/30-tmpfs.conf

    sleep 1
    clear

    printf "%bGenerating new initramfs...%b\n" "${BLUE}" "${NORMAL}"
    sleep 1
    run_command dracut --regenerate-all --force --hostonly
}

# Sets the previous keyboard layout in the
# chroot environment and in dracut
set_keyboard_layout() {
    clear
    if [[ -z "${selectedKeyboardLayout}" ]]; then
        printf "%bNo keyboard layout set.%b\n" "${YELLOW}" "${NORMAL}"
        return 1
    fi

    printf "%bSetting keyboard layout in /etc/rc.conf to %b%s%b.%b\n" "${BLUE}" "${NORMAL}${PINK}" "${selectedKeyboardLayout}" "${NORMAL}${BLUE}" "${NORMAL}"
    sed -i "/#KEYMAP=/s/.*/KEYMAP=\"${selectedKeyboardLayout}\"/" /etc/rc.conf

    printf "%bSetting keyboard layout in dracut and regenerating initramfs...%b\n" "${BLUE}" "${NORMAL}"
    echo -e "i18n_vars=\"/etc/rc.conf:KEYMAP\"\ni18n_install_all=\"no\"" >>/etc/dracut.conf.d/i18n.conf
    sleep 1

    run_command dracut --regenerate-all --force --hostonly
}

# Generating the fstab file using UUID
creating_fstab() {
    clear

    sleep 1

    efiUUID="$(blkid -s UUID -o value "${efiPartition}")"
    bootUUID="$(blkid -s UUID -o value "${bootPartition}")"
    rootUUID="$(blkid -s UUID -o value "${rootPartition}")"

    if "${isEncrypted}"; then
        luksUUID="$(blkid -s UUID -o value "${luksPartition}")"
    fi

    printf "%bGenerating /etc/fstab...%b\n" "${BLUE}" "${NORMAL}"
    sed -i '/tmpfs/d' /etc/fstab
    sleep 1
    cat <<EOF >>/etc/fstab
# ROOT subvolume
UUID=${rootUUID} / btrfs ${BTRFS_OPTS},subvol=@ 0 1

# HOME subvolume
UUID=${rootUUID} /home btrfs ${BTRFS_OPTS},subvol=@home 0 2

# Snapshots subvolume
UUID=${rootUUID} /.snapshots btrfs ${BTRFS_OPTS},subvol=@snapshots 0 2

# Log folders, to allow booting snapshots with rd.live.overlayfs=1
UUID=${rootUUID} /var/log $(blkid --match-tag TYPE --output value "${rootPartition}") ${BTRFS_OPTS},subvol=@/var/log 0 0

# BOOT Partition
UUID=${bootUUID} /boot ext4 defaults,noatime 0 2

# EFI Partition
UUID=${efiUUID} /boot/efi vfat defaults,noatime 0 2

# TMPFS
tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0
EOF

    printf "%bSuccesfully created /etc/fstab%b\n" "${GREEN}" "${NORMAL}"
    sleep 1
}

# Prompting the user to enter a bootloader id and
# configuring grub with the neccessary CMDLINE options for encryption and apparmor
grub_install() {
    local bootloaderID

    clear

    sed -i "/GRUB_CMDLINE_LINUX_DEFAULT=/s/\"$/ apparmor=1 security=apparmor&/" /etc/default/grub

    if [[ "${isEncrypted}" ]]; then
        printf "%bEnabling CryptoDisk in grub...%b\n" "${BLUE}" "${NORMAL}"
        echo -e -n "GRUB_ENABLE_CRYPTODISK=y" >>/etc/default/grub
        sed -i "/GRUB_CMDLINE_LINUX_DEFAULT=/s/\"$/ rd.auto=1 rd.luks.name=${luksUUID}=${luksName}&/" /etc/default/grub

        if [[ "${isSsd}" ]]; then
            sed -i "/GRUB_CMDLINE_LINUX_DEFAULT=/s/\"$/ rd.luks.allow-discards=${luksUUID}&/" /etc/default/grub
        fi
    else
        sed -i "/GRUB_CMDLINE_LINUX_DEFAULT=/s/\"$ rd.auto1&/" /etc/default/grub
    fi

    while true; do
        clear
        printf "%bEnter a booloader id: %b" "${CYAN}" "${NORMAL}"
        read -r bootloaderID

        if [[ -z "${bootloaderID}" ]]; then
            printf "%bNot a valid input.%b\n" "${YELLOW}" "${NORMAL}"
            sleep 1
            continue
        elif ! ask_yn "Is this the booloader ID you want to use (${bootloaderID})"; then
            continue
        fi

        break
    done

    sleep 1
    clear

    printf "%bInstalling grub at /boot/efi with the bootloader id %b%s%b.%b" "${BLUE}" "${NORMAL}${PINK}" "${bootloaderID}" "${NORMAL}${BLUE}" "${NORMAL}"
    run_command grub-install --target=x86_64-efi --boot-directory=/boot --efi-directory=/boot/efi --bootloader-id="${bootloaderID}" --recheck
    printf "%bEnabling grub snapshots service...%b\n" "${BLUE}" "${NORMAL}"
    ln -sf /etc/sv/grub-btrfs /etc/runit/runsvdir/default/

    printf "%bSuccesfully installed grub.%b\n" "${GREEN}" "${NORMAL}"
    sleep 1
}

creating_crypttab() {
    clear
    printf "%bGenerating random key to avoid typing encryption password twice on boot.%b\n" "${BLUE}" "${NORMAL}"
    run_command dd bs=512 count=4 if=/dev/random of=/boot/volume.key

    printf "%bRandom key generated, unlocking the encrypted partition.%b\n" "${GREEN}" "${NORMAL}"
    if ! run_command cryptsetup luksAddKey "${luksPartition}" /boot/volume.key; then
        printf "%bSomething went wrong.%b\n" "${YELLOW}" "${NORMAL}"
        return 1
    else
        chmod 000 /boot/volume.key
        chmod -R g-rwx,o-rwx /boot

        printf "%bAdding random key to /etc/crypttab.%b\n" "${BLUE}" "${NORMAL}"
        echo -e "\n${luksName} UUID=${luksUUID} /boot/volume.key luks,discard\n" >>/etc/crypttab

        printf "%bAdding random key to dracut configuration file.%b\n" "${BLUE}" "${NORMAL}"
        echo -e "install_items+=\" /boot/volume.key /etc/crypttab \"" >>/etc/dracut.conf.d/10-crypt.conf
    fi

    run_command dracut --regenerate-all --force --hostonly
}

# Prompts the user if they want to create a swapfile and the size of it
# Then creates the swapfile and tell the bootloader to enable swap and zswap
configure_swap() {
    local swapSize
    clear
    if ! ask_yn "Do you want to enable swap"; then
        return 0
    fi

    while true; do
        clear
        printf "%bYour system has %b%sG%b of ram.%b\n" "${CYAN}" "${NORMAL}${PINK}" "${RAM_SIZE}" "${NORMAL}${CYAN}" "${NORMAL}"
        printf "%bPress enter to create a swapfile of the same size or enter your desired swap size in GB: %b" "${CYAN}" "${NORMAL}"
        read -r swapSize

        if [[ -z "${swapSize}" ]]; then
            swapSize="${RAM_SIZE}"
        elif [[ "${swapSize}" =~ ${REGEX_STRING} ]] || [[ "${swapSize}" -le 0 ]]; then
            printf "%bNot a valid input.%b\n" "${YELLOW}" "${NORMAL}"
            sleep 1
            continue
        fi

        printf "%bSwapfile of %b%sG%b will be created at /swap/ btrfs subvolume.%b\n" "${BLUE}" "${NORMAL}${PINK}" "${swapSize}" "${NORMAL}${BLUE}" "${NORMAL}"

        run_command btrfs filesystem mkswapfile /swap/swapfile --size "${swapSize}"G
        run_command mkswap --label "SwapFile" /swap/swapfile
        run_command swapon /swap/swapfile
        resumeUUID=$(findmnt -no UUID -T /swap/swapfile)
        resumeOffset=$(btrfs inspect-internal map-swapfile -r /swap/swapfile)

        sleep 1
        clear

        printf "%bEnabling swap in grub...%b\n" "${BLUE}" "${NORMAL}"
        sed -i "/GRUB_CMDLINE_LINUX_DEFAULT=/s/\"$/ resume=UUID=${resumeUUID} resume_offset=${resumeOffset}&/" /etc/default/grub

        sleep 0.5
        clear

        printf "%bEditing /etc/fstab to include the swapfile...%b\n" "${BLUE}" "${NORMAL}"
        echo -e -n "\n# Swap Subvolume\nUUID=${rootUUID} /swap $(blkid --match-tag TYPE --output value "${rootPartition}") ${BTRFS_OPTS},subvol=@swap 0 2\n" >>/etc/fstab
        echo -e -n "\n# SwapFile\n/swap/swapfile none swap sw 0 0\n" >>/etc/fstab

        sleep 0.5
        clear

        printf "%bEnabling zswap...%b\n" "${BLUE}" "${NORMAL}"
        echo "add_drivers+=\" lz4hc lz4hc_compress zsmalloc \"" >>/etc/dracut.conf.d/40-add_zswap_drivers.conf

        sleep 0.5
        clear

        printf "%bRegenerating dracut initramfs...%b\n" "${BLUE}" "${NORMAL}"
        run_command dracut --regenerate-all --force --hostonly

        sed -i "/GRUB_CMDLINE_LINUX_DEFAULT=/s/\"$/ zswap.enabled=1 zswap.max_pool_percent=25 zswap.compressor=lz4hc zswap.zpool=zsmalloc&/" /etc/default/grub
        printf "%bUpdating grub...%b\n" "${BLUE}" "${NORMAL}"
        update-grub

        swapoff --all
        printf "%bSwapfile successfully create and zswap successfully enabled%b\n" "${GREEN}" "${NORMAL}"
        sleep 1
        break
    done
}

# Prompts the user what shell he wants for their user
select_user_shell() {
    mapfile -t availableShells < <(chsh --list-shells)

    while true; do
        clear
        PS3='Please enter the default shell you want to use for your user: '
        select opt in "${availableShells[@]}"; do
            if [[ -n "${opt}" ]]; then
                printf "%bSet user shell to %b%s%b.%b" "${GREEN}" "${NORMAL}${PINK}" "${opt}" "${NORMAL}${GREEN}" "${NORMAL}"
                selectedShell="${opt}"
                sleep 1
                break 2
            else
                printf "%bNot a valid input.%b\n" "${YELLOW}" "${NORMAL}"
                continue
            fi
        done
        PS3=''
    done
}

# Prompts the user to create 1 or more new user
# then sets the password and creates the home for that user
setup_user() {
    local userName

    while true; do
        clear
        printf "%bEnter a username: %b" "${CYAN}" "${NORMAL}"
        read -r userName

        if [[ -z "${userName}" || "${userName}" == "root" ]]; then
            printf "%bPlease enter a valid username.%b\n" "${YELLOW}" "${NORMAL}"
            continue
        elif id "${userName}" &>/dev/null; then
            printf "%bUser %b%s%b already exists. Please enter another username.%b\n" "${YELLOW}" "${NORMAL}${PINK}" "${userName}" "${NORMAL}${YELLOW}" "${NORMAL}"
            sleep 1
            continue
        fi
        break
    done

    sleep 0.5
    clear

    printf "%bCreating new user %b%s%b and giving them access to groups:%b\n" "${BLUE}" "${NORMAL}${PINK}" "${userName}" "${NORMAL}${BLUE}" "${NORMAL}"
    printf "%bkmem, wheel, tty, tape, daemon, floppy, disk, lp, dialout, audio, video,\nutmp, cdrom, optical, mail, storage, scanner, kvm, input, plugdev, users.%b\n" "${BLUE}" "${NORMAL}"

    select_user_shell
    useradd --create-home -d /home/"${userName}" --groups wheel,audio,video,input,kvm,storage,network --shell "${selectedShell}" "${userName}"

    while true; do
        clear
        printf "%bPlease create a passphrase for the new user %b%s%b.%b\n" "${CYAN}" "${NORMAL}${PINK}" "${userName}" "${NORMAL}${CYAN}" "${NORMAL}"
        if ! passwd "${userName}"; then
            printf "%bSomething went wrong.%b\n" "${YELLOW}" "${NORMAL}"
            continue
        fi

        break
    done

    printf "%bNew user %b%s%b succesfully created.%b\n" "${GREEN}" "${NORMAL}${PINK}" "${userName}" "${NORMAL}${GREEN}" "${NORMAL}"
    sleep 1
    clear

    if ask_yn "Do you want to create another user"; then
        setup_user
    fi
}

# Enables some neccessary services needed right after reboot
enabling_services() {
    ln -sf /etc/sv/dbus /etc/runit/runsvdir/default/
    ln -sf /etc/sv/NetworkManager /etc/runit/runsvdir/default/
}

# Prompts the user if they want to install my post-install script from this repository
# and for which user they want to install it on
# Reconfigure all packages and leaves the chroot environment after everythings done
finish_chroot() {
    local existingUsers postInstallUser

    mapfile -t existingUsers < <(cat /etc/passwd | grep '/home' | cut -d: -f1)

    clear

    if ask_yn "Do you want to install the post install script which is located in the same repository"; then
        PS3='Which user should install the post-install script: '
        select opt in "${existingUsers[@]}" "QUIT",; do
            if [[ "${opt}" =~ ${REGEX_QUIT} ]]; then
                finish_chroot
                return 0
            elif [[ -n "${opt}" ]]; then
                clear
                if ! ask_yn "Is this the user you want to use (${opt})"; then
                    break
                fi

                postInstallUser="${opt}"
                break
            fi
        done
    fi

    clear

    curl -o /home/"${postInstallUser}"/post-install --fail https://codeberg.org/AculBoy/VoidLinuxInstaller/raw/branch/main/post-install
    chown "${postInstallUser}":"${postInstallUser}" /home/"${postInstallUser}"/post-install
    chmod +x /home/"${postInstallUser}/post-install"

    printf "%bReconfiguring every package...%b\n" "${BLUE}" "${NORMAL}"
    run_command xbps-reconfigure -fa

    printf "%bEverything done. Exiting chroot.%b\n" "${GREEN}" "${NORMAL}"
    sleep 1
    exit 0
}

main() {
    set_permissions
    set_hostname
    set_locales
    set_timezone
    creating_dracut_config
    set_keyboard_layout
    creating_fstab
    # creating_crypttab
    grub_install
    configure_swap
    setup_user
    enabling_services
    finish_chroot
}

main
