#!/bin/sh

#This is just some memory for myself on how I install my Void Linux environment.


#First install the computer with a iso from void.

#https://voidlinux.org/download/

#xfce alternative
#I use musl with xfce

#glibc
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-xfce.iso
#musl
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-musl-20250202-xfce.iso


#Run the install.sh to install some nice features, like htop, telnet, mc etc etc

#The default DE/Window manager is xfce and Ive configured this and made a zip of it
#Binary downloads from github sucks, so clone the repository instead.


git clone https://github.com/DeuxEx/voidlinux

bash voidlinux/after_install.sh g


#Enable flatpak repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


#setup the xfce4 the way I want it
unzip -o voidlinux/xfce_settings_rev1.zip


#how i created the zip
#zip xfce_settings_rev1.zip .config/xfce4/xfconf/xfce-perchannel-xml/*
#show content
#ls -l .config/xfce4/xfconf/xfce-perchannel-xml/




Troubleshooting
Cannot login to xfce and no network

Write your ssid and passphrase into the default conf:

wpa_passphrase "MYSSID" "passphrase" >> /etc/wpa_supplicant/wpa_supplicant.conf

Enable the necessary services:
ln -s /etc/sv/wpa_supplicant /var/service
ln -s /etc/sv/dhcpcd /var/service

Run the services:
sv -v up wpa_supplicant
sv -v up dhcpcd



#backing up:
#Core Configs & Services:
sudo tar -czvf etc_backup_$(date +%F).tar.gz /etc /var/service

#User Dotfiles:
tar -czvf home_configs_$(date +%F).tar.gz ~/.bashrc ~/.config /home/void/.local/share/applications

# List all manually installed packages pipe inside a textfile
xbps-query -m > installed_packages.txt
# To reinstall:
# sudo xbps-install -S -R repo-main.voidlinux.org -r <your-arch> $(cat installed_packages.txt)
#dry-run
xbps-install --dry-run $(cat installed_packages.txt)



# Set up bluetooth autostart
sudo ln -s /etc/sv/bluetoothd /var/service/

# Set up ACPI
sudo ln -s /etc/sv/acpid/ /var/service/
sudo sv enable acpid
sudo sv start acpid




# Install GPU drivers
install_gpu_driver() {
  gpu_driver=""
  case "$(lspci | grep -E 'VGA|3D')" in
    *Intel*) gpu_driver="mesa-dri intel-video-accel vulkan-loader mesa-vulkan-intel" ;;
    *AMD*)   gpu_driver="mesa-dri mesa-vaapi mesa-vdpau vulkan-loader mesa-vulkan-radeon" ;;
    *NVIDIA*)gpu_driver="mesa-dri nvidia nvidia-libs-32bit" ;;
  esac
  for pkg in $gpu_driver; do
    [ -n "$pkg" ] && sudo xbps-install -y "$pkg"
  done
}

install_gpu_driver




<pre>[root@void-deux-640g10 void]# fastfetch
<font color="#55FF55"><b>                __.;=====;.__</b></font>                    <font color="#55FF55"><b>root</b></font>@<font color="#55FF55"><b>void-deux-640g10</b></font>
<font color="#55FF55"><b>            _.=+==++=++=+=+===;.</b></font>                 ---------------------
<font color="#55FF55"><b>             -=+++=+===+=+=+++++=_</b></font>               <b>OS</b>: Void Linux x86_64
<font color="#55FF55"><b>        .     -=:``     `--==+=++==.</b></font>             <b>Host</b>: HP EliteBook 640 14 inch G10 Notebook PC (SBKPF,SBKPFV2)
<font color="#55FF55"><b>       _vi,    `            --+=++++:</b></font>            <b>Kernel</b>: Linux 6.12.63_1
<font color="#55FF55"><b>      .uvnvi.       _._       -==+==+.</b></font>           <b>Uptime</b>: 50 mins
<font color="#55FF55"><b>     .vvnvnI`    .;==|==;.     :|=||=|.</b></font>          <b>Packages</b>: 784 (xbps)
<font color="#555555"><b>+QmQQm</b></font><font color="#55FF55"><b>pvvnv;</b></font><font color="#555555"><b> _yYsyQQWUUQQQm #QmQ#</b></font><font color="#55FF55"><b>:</b></font><font color="#555555"><b>QQQWUV$QQm.</b></font>    <b>Shell</b>: bash 5.3.0
<font color="#555555"><b> -QQWQW</b></font><font color="#55FF55"><b>pvvo</b></font><font color="#555555"><b>wZ?.wQQQE</b></font><font color="#55FF55"><b>==&lt;</b></font><font color="#555555"><b>QWWQ/QWQW.QQWW</b></font><font color="#55FF55"><b>(:</b></font><font color="#555555"><b> jQWQE</b></font>    <b>Display (AUO229E)</b>: 1920x1080 in 14&quot;, 60 Hz [Built-in]
<font color="#555555"><b>  -$QQQQmmU&apos;  jQQQ</b></font><font color="#55FF55"><b>@+=&lt;</b></font><font color="#555555"><b>QWQQ)mQQQ.mQQQC</b></font><font color="#55FF55"><b>+;</b></font><font color="#555555"><b>jWQQ@&apos;</b></font>    <b>DE</b>: Xfce4 4.20
<font color="#555555"><b>   -$WQ8Y</b></font><font color="#55FF55"><b>nI:</b></font><font color="#555555"><b>   QWQQwgQQWV</b></font><font color="#55FF55"><b>`</b></font><font color="#555555"><b>mWQQ.jQWQQgyyWW@!</b></font>      <b>WM</b>: Xfwm4 (X11)
<font color="#555555"><b>     </b></font><font color="#55FF55"><b>-1vvnvv.     `~+++`        ++|+++</b></font>           <b>Theme</b>: Adwaita [GTK2/3/4]
<font color="#55FF55"><b>      +vnvnnv,                 `-|===</b></font>            <b>Icons</b>: Adwaita [GTK2/3/4]
<font color="#55FF55"><b>       +vnvnvns.           .      :=-</b></font>            <b>Font</b>: Sans (10pt) [GTK2/3/4]
<font color="#55FF55"><b>        -Invnvvnsi..___..=sv=.     `</b></font>             <b>Terminal</b>: xfce4-terminal 1.1.5
<font color="#55FF55"><b>          +Invnvnvnnnnnnnnvvnn;.</b></font>                 <b>Terminal Font</b>: Monospace (10pt)
<font color="#55FF55"><b>            ~|Invnvnvvnvvvnnv}+`</b></font>                 <b>CPU</b>: 13th Gen Intel(R) Core(TM) i5-1335U (12) @ 4.60 GHz
<font color="#55FF55"><b>               -~|{*l}*|~</b></font>                        <b>GPU</b>: Intel UHD Graphics @ 1.25 GHz [Integrated]
                                                 <b>Memory</b>: 2.24 GiB / 15.26 GiB (<font color="#00AA00">15%</font>)
                                                 <b>Swap</b>: Disabled
                                                 <b>Disk (/)</b>: 5.69 GiB / 117.56 GiB (<font color="#00AA00">5%</font>) - ext4
                                                 <b>Disk (/home)</b>: 227.01 MiB / 97.87 GiB (<font color="#00AA00">0%</font>) - ext4
                                                 <b>Local IP (wlp0s20f3)</b>: 192.168.1.127/24
                                                 <b>Battery (Primary)</b>: <font color="#00AA00">98%</font> [Charging, AC Connected]
                                                 <b>Locale</b>: en_US.UTF-8

                                                 <span style="background-color:#000000">   </span><span style="background-color:#AA0000">   </span><span style="background-color:#00AA00">   </span><span style="background-color:#AA5500">   </span><span style="background-color:#0000AA">   </span><span style="background-color:#AA00AA">   </span><span style="background-color:#00AAAA">   </span><span style="background-color:#AAAAAA">   </span>
                                                 <span style="background-color:#555555">   </span><span style="background-color:#FF5555">   </span><span style="background-color:#55FF55">   </span><span style="background-color:#FFFF55">   </span><span style="background-color:#5555FF">   </span><span style="background-color:#FF55FF">   </span><span style="background-color:#55FFFF">   </span><span style="background-color:#FFFFFF">   </span>
[root@void-deux-640g10 void]# ^C
[root@void-deux-640g10 void]# 

</pre>


