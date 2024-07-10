#!/bin/bash

# Update system prior to removal
echo "Updating system prior to removal"
echo ""
sleep 1
sudo systemctl daemon-reload
sudo apt update; sudo apt full-upgrade; sudo apt auto-remove
echo ""

# Uninstall all installed snaps
echo "Uninstalling snap packages"
echo ""
sudo snap remove $(snap list | awk '!/^Name|^core/ {print $1}')
echo ""
sleep 1

# Stop snapd service
echo "Stopping snapd service"
sudo systemctl stop snapd.service
echo ""
sleep 1

# Uninstall snapd package manager
echo "Purging snapd from system"
sleep 1
sudo apt purge snapd
sudo systemctl daemon-reload
echo ""
sleep 1

# Remove snapd cache directory
echo "Removing snapd directory"
sleep 1
sudo rm -rf /var/lib/snapd
sudo rm -rf /var/snap
echo ""
sleep 1

# Prevent automatic reinstall
echo "Making it so snapd can't be installed again"
sleep 1
sudo apt-mark hold snapd
echo ""
sleep 1

# Install Flatpak
echo "Installing Flatpak with the stable and beta Flathub repo"
sleep 1
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
echo ""
sleep 1

# Install the Software Flatpak plugin (optional, for graphical installation)
# Uncomment the following line to enable graphical flatpak installation through Software app
# echo "Installing gnome-software-plugin-flatpak"
# sudo apt install gnome-software-plugin-flatpak
# echo ""
# sleep 1

# Uncomment to install useful software automatically
# echo "Installing basic software"
# flatpak install firefox mpv vlc kwrite spotify flatseal onlyoffice org.gnome.Loupe
# echo ""
# sleep 1

echo "Snap removed and Flatpak installed"
echo ""
echo "Made with love by Reverend Retro"
sleep 1
