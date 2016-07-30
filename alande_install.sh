#! /bin/bash

# This script should install all of the prerequisite packages for AlanDE, 
# then invoke makepkg to install the common config files, and finally enable
# any required services for the DE.

# #AUR Dependencies:
 aur_list=(	'numix-icon-theme-git' 'numix-circle-icon-theme-git'  'midori-flash'	'sublime-text')

repo_list=(	
			'metacity'		# WM and compositor
			'numix-themes' 			# GTK theme
			'ttf-dejavu' 'noto-font'	# Font
			'synapse'				# Application launcher
			'lxpanel' 'lxinput' 'lxrandr' 'lxtask'
			'lxsession'		# Session manager
			'terminator'	# Terminal
			'lightdm' 'lightdm-gtk-greeter' 'lightdm-gtk-greeter-settings'	#Display manager
			'pulseaudio' 'pulseaudio-alsa' 'pavucontrol'	# Sound 
			'pcmanfm' 'gvfs' 'xarchiver' 'p7zip'			# File manager + extensions
			'networkmanager' 'network-manager-applet'		# Networking
			# Temporary
			'midori' 		# Web browser (with flash plugin in AUR)
			'lxappearance' 	# GTK theming GUI
			'nspluginwrapper'
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

# Symlink user config files.  As far as I can tell, these config files HAVE to be in a user's home
# directory to work, plus I can't get the PKGBUILD or .install script to create these in a nicer way.

# GTK tweaks to fix Metacity title bar size
mkdir -p $HOME/.config/gtk-3.0/
ln -fs "/etc/gtk-3.0/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"

# Custom Synapse config file
mkdir -p $HOME/.config/synapse/
ln -fs "/etc/xdg/synapse/AlanDE/config.json" "$HOME/.config/synapse/config.json"

# libfm config - this affects PCManFM
mkdir -p $HOME/.config/libfm/
ln -fs "/etc/xdg/libfm/AlanDE/libfm.conf" "$HOME/.config/libfm/libfm.conf"

# LightDM greeter config - can't find any way to override the default config file. 
# The greeter won't follow a symlink, either.
sudo rm "/etc/lightdm/AlanDE/lightdm-gtk-greeter.conf"
sudo cp "/etc/lightdm/AlanDE/lightdm-gtk-greeter.conf" "/etc/lightdm/lightdm-gtk-greeter.conf"