#! /bin/bash

# This script should install all of the prerequisite packages for AlanDE, 
# then invoke makepkg to install the common config files, and finally enable
# any required services for the DE.

# #AUR Dependencies:
 aur_list=(	'numix-icon-theme-git' 'numix-circle-icon-theme-git'
 			# Akk of the packages below are required in order to use the git version of 
 			# lxsession, which is used at the moment because it fixes a number of bugs 
 			# in the current repository versionof lxsession.
			'libdbusmenu'
			'libindicator'
			'libappindicator'
 			'lxsession-git'
 			'connman-gtk'
 			)

repo_list=(	
			'metacity'		# WM and compositor
			'numix-themes' 			# GTK theme
			'noto-fonts' 'noto-fonts-emoji'	# Font
			'synapse'				# Application launcher
			'lxpanel' 'lxrandr'
			#'lxsession'		# Session manager
			'terminator'	# Terminal
			'lightdm' 'lightdm-gtk-greeter'	'light-locker'
			'pulseaudio' 'pulseaudio-alsa' 'pavucontrol'	# Sound 
			'pcmanfm' 'gvfs' 'xarchiver' 'p7zip' 'ntfs-3g'	'gvfs-mtp'		# File manager + extensions
			'wpa_supplicant' 'connman'
			'chromium'
			'xbindkeys'	# Used for some global keybindings, e.g. print screen
			'pinta' 'gpicview' 'gnome-screenshot'
			'pluma' # Nice text editor
			'evince' #Nice pdf reader
			'gparted' 
			'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
			'mpv'
			)

aur_address='https://aur.archlinux.org/'


# Check that pacman is available
if  !(hash pacman 2>/dev/null);  then
	echo "Pacman isn't installed, are you sure you're using Arch Linux?"
	exit 1
fi

echo "Updating repositories prior to installation."
sudo pacman -Syu --noconfirm

# Make sure git is available for handling AUR packages
if  !(hash git 2>/dev/null);  then
	echo "Git not installed. Fixing:"
	sudo pacman -S git --noconfirm
fi


# Install AUR packages
for pkg in "${aur_list[@]}"; do
	if !(pacman -Q $pkg 1>/dev/null); then
		echo "Installing $pkg "
		git clone $aur_address$pkg
		cd $pkg
		makepkg -sri --noconfirm
		cd ..
	else
		echo "$pkg is already installed, skipping."
	fi
done

# Install repository packages
for pkg in "${repo_list[@]}"; do
	if !(pacman -Q $pkg 1>/dev/null); then
		echo "Installing $pkg"
		sudo pacman -S $pkg --noconfirm
	else
		echo "$pkg is already installed, skipping."
	fi
done

# Install AlanDE package
makepkg -sri --noconfirm

# Enable necessary systemd services
sudo systemctl enable lightdm.service
sudo systemctl enable connman.service

# Symlink user config files.  As far as I can tell, these config files HAVE to be in a user's home
# directory to work, plus I can't get the PKGBUILD or .install script to create these in a nicer way.

# GTK tweaks to fix Metacity title bar size
mkdir -p $HOME/.config/gtk-3.0/
ln -fs "/etc/gtk-3.0/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"

# Custom Synapse config file
mkdir -p $HOME/.config/synapse/
ln -fs "/usr/share/AlanDE/synapse/config.json" "$HOME/.config/synapse/config.json"

# libfm config - this affects PCManFM
mkdir -p $HOME/.config/libfm/
ln -fs "/usr/share/AlanDE/libfm/libfm.conf" "$HOME/.config/libfm/libfm.conf"

# Terminator config - won't follow a symlink
mkdir -p $HOME/.config/terminator/
cp -f "/usr/share/AlanDE/terminator/config" "$HOME/.config/terminator/config"

# LightDM greeter config - can't find any way to override the default config file. 
# The greeter won't follow a symlink, either.
sudo rm "/etc/lightdm/lightdm-gtk-greeter.conf"
sudo cp "/usr/share/AlanDE/lightdm/lightdm-gtk-greeter.conf" "/etc/lightdm/lightdm-gtk-greeter.conf"

ln -fs "/usr/share/AlanDE/xbindkeys/xbindkeysrc" "$HOME/.xbindkeysrc"
