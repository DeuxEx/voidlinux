
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
