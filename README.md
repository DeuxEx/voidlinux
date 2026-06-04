<a href="https://repo-default.voidlinux.org/">
<img src="void_button.gif" alt="Description"></a>

<h1>VOID LINUX</h1>

This is just some notes, configs and reminders for myself on how I install my Void Linux environment.

First install the computer with an ISO from void: https://voidlinux.org/download/

I use glibc base (no window manager)
musl is for thinner single processing computers without need of GPU and other repositories than the default in xbps.

<h2>VARIANTS</h2>

#glibc base
https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-base.iso<br>
#glibc with xfce
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-xfce.iso<br>
#musl with xfce
#https://repo-default.voidlinux.org/live/current/void-live-x86_64-musl-20250202-xfce.iso<p>

xbps-install git<b>
git clone https://github.com/DeuxEx/voidlinux<p>

Run the voidlinux/after_install.sh to install some good applications and routines, like htop, telnet, mc etc:
bash voidlinux/after_install.sh g

<h2>FLATPAK</h2>

Enable flatpak repository:
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#flatpak install rustdesk
#flatpak install opera

<h2>XFCE</h2>

If using xfce I've configured the activity-bar and made a zip of it:
#unzip -o voidlinux/xfce_settings_rev2.zip
#how i created the zip, -r = recurse
#zip -r xfce_settings_rev2.zip .config/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/ ~/.bashrc ~/.bash_profile /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /etc/xdg/xfc[...]

<h2>CINNAMON</h2>

If using cinnamon (which I do) I've backed up my settings here:
#tar -czvf cinnamon_config_backup.tar.gz ~/.cinnamon ~/.local/share/cinnamon ~/.config/cinnamon /home/void/.local/share/cinnamon/
#untar -xvf cinnamon_config_backup.tar.gz

<h2>NANO</h2>

Create tarball with my nano-settings:
#tar -czvf nano-settings.tar /etc/nanorc /root/.nano/
# un-tar to root
tar -xvf nano-settings.tar -C /

<h2>UFW</h2>

If using ufw (uncomplicated firewall) here are my backed up settings for my firewall:
#create tarball
tar .czvf ufw-rules.tar /etc/ufw/
#untar the tarball
untar -xvf ufw-rules.tar
