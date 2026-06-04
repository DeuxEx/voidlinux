<a href="https://repo-default.voidlinux.org/">
<img src="void_button.gif" alt="Description"></a>

<h1>VOID LINUX</h1>

This is just some notes, configs and reminders for myself on how I install my Void Linux environment.<br>

First install the computer with an ISO from void: https://voidlinux.org/download/<br>

I use glibc base (no window manager)<br>
musl is for thinner single processing computers without need of GPU and other repositories than the default in xbps.<p>

<h2>VARIANTS</h2>

glibc base<br>
https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-base.iso<br>
glibc with xfce<br>
https://repo-default.voidlinux.org/live/current/void-live-x86_64-20250202-xfce.iso<br>
musl with xfce<br>
https://repo-default.voidlinux.org/live/current/void-live-x86_64-musl-20250202-xfce.iso<p>

xbps-install git<br>
<b>git clone https://github.com/DeuxEx/voidlinux</b><p>

Run the voidlinux/after_install.sh to install some good applications and routines, like htop, telnet, mc etc:<br>
bash voidlinux/after_install.sh g<p>

<h2>FLATPAK</h2>

Enable flatpak repository:<br>
<b>flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo</b><br>
<b>flatpak install rustdesk</b><br>
<b>flatpak install opera</b><p>

<h2>XFCE</h2>

If using xfce I've configured the activity-bar and made a zip of it:<br>
<b>unzip -o voidlinux/xfce_settings_rev2.zip</b><br>
how i created the zip, -r = recurse<br>
<b>zip -r xfce_settings_rev2.zip .config/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/ ~/.bashrc ~/.bash_profile /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /etc/xdg/xfc[...]</b><p>

<h2>CINNAMON</h2>

If using cinnamon I've backed up my settings here:<br>
<b>tar -czvf cinnamon_config_backup.tar.gz ~/.cinnamon ~/.local/share/cinnamon ~/.config/cinnamon /home/void/.local/share/cinnamon/</b><br>
<b>untar -xvf cinnamon_config_backup.tar.gz</b><p>

<h2>NANO</h2>

Create tarball with my nano-settings:<br>
<b>tar -czvf nano-settings.tar /etc/nanorc /root/.nano/</b><br>
un-tar to root<br>
<b>tar -xvf nano-settings.tar -C /</b><p>

<h2>UFW</h2>

If using ufw (uncomplicated firewall) here are my backed up settings for my firewall:<br>
create tarball<br>
<b>tar .czvf ufw-rules.tar /etc/ufw/</b><br>
extract the tarball<br>
<b>untar -xvf ufw-rules.tar</b><p>





