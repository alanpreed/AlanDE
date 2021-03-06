#! /bin/bash

# This script should install all of the prerequisite packages for AlanDE, 
# then invoke makepkg to install the common config files, and finally enable
# any required services for the DE.

# #AUR Dependencies:
 aur_list=(	
	 		# Icon theme
	 		'numix-icon-theme-git' 'numix-circle-icon-theme-git'
			 # GUI for networking
 			'connman-gtk'	
 			)

repo_list=(	
			# WM and compositor
			'bspwm'	'sxhkd'	'picom' 'xorg-server'
			# GTK theme	
			'numix-gtk-theme' 			
			'gtk-engine-murrine'
			'noto-fonts' 'noto-fonts-emoji' 'noto-fonts-cjk'	
			# Application launcher
			'rofi'
			'lxpanel' 
			# Session manager
			'lxsession'	
			# Terminal
			'terminator'	
			# Display manager
			'lightdm' 'lightdm-gtk-greeter'	'light-locker'
			# Sound 
			'pulseaudio' 'pulseaudio-alsa' 'pavucontrol'
			# File manager + extensions
			'pcmanfm' 'gvfs' 'xarchiver' 'p7zip' 'ntfs-3g'	
			'exfat-utils' 'gvfs-mtp' 'gvfs-smb' 'unzip' 'unrar'
			# Networking	
			'wpa_supplicant' 'connman'
			# Photo viewer
			'gpicview' 'gnome-screenshot'
			# Monitor configuration utility
			'arandr'
			# Backlight control
			'light'
			# PDF viewer
			'evince'
			# Partitioning tool
			'gparted' 
			# Media codecs
			'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
			# Video player
			'mpv'
			# Music player
			'clementine'
			# Photo manager
			'shotwell'
			# Browser
			'firefox'
			# File synchroniser
			'unison'
			# Network and task monitor utilities
			'nethogs' 'htop'
			)

aur_address='https://aur.archlinux.org/'

package_name='AlanDE-git'

# Check that pacman is available
if  !(hash pacman 2>/dev/null);  then
	echo "Pacman isn't installed, are you sure you're using Arch Linux?"
	exit 1
fi

echo "Updating repositories prior to installation."
sudo pacman -Syu --ignore linux --noconfirm

# Make sure git is available for handling AUR packages
if  !(hash git 2>/dev/null);  then
	echo "Git not installed. Fixing:"
	sudo pacman -S git --noconfirm
fi

# Install repository packages
for pkg in "${repo_list[@]}"; do
	if !(pacman -Q $pkg 1>/dev/null); then
		echo "Installing $pkg"

		# Exit the script if we are unable to install a package
		if  !(sudo pacman -S $pkg --noconfirm);  then
			echo "Installation of $testpkg failed!"
			exit 1
		fi
	else
		echo "$pkg is already installed, skipping."
	fi
done

# Install AUR packages
for pkg in "${aur_list[@]}"; do
	if !(pacman -Q $pkg 1>/dev/null); then
		echo "Installing $pkg "
		git clone $aur_address$pkg
		cd $pkg

		# Exit the script if we are unable to install a package
		if !(makepkg -sri --noconfirm); then
			echo "Installation of $pkg failed!"
			cd ..
			exit 1
		fi
		cd ..
	else
		echo "$pkg is already installed, skipping."
	fi
done

# Install AlanDE package
if !(pacman -Q $package_name 1>/dev/null); then
		echo "Installing $package_name"

		if !(makepkg -sri --noconfirm); then
			echo "Installation of $package_name failed!"
			exit 1
		fi
else
	echo "AlanDE already installed, skipping."
fi


# Enable necessary systemd services
sudo systemctl enable lightdm.service
sudo systemctl enable connman.service
sudo systemctl enable iptables.service

# Symlink user config files.  As far as I can tell, these config files HAVE to be in a user's home
# directory to work, plus I can't get the PKGBUILD or .install script to create these in a nicer way.

# libfm config - this affects PCManFM
mkdir -p $HOME/.config/libfm/
ln -fs "/usr/share/AlanDE/libfm/libfm.conf" "$HOME/.config/libfm/libfm.conf"

# Terminator config - won't follow a symlink
mkdir -p $HOME/.config/terminator/
cp -f "/usr/share/AlanDE/terminator/config" "$HOME/.config/terminator/config"

# LightDM greeter config - can't find any way to override the default config file. 
# The greeter won't follow a symlink, either.
sudo rm -f "/etc/lightdm/lightdm-gtk-greeter.conf"
sudo cp "/usr/share/AlanDE/lightdm/lightdm-gtk-greeter.conf" "/etc/lightdm/lightdm-gtk-greeter.conf"

# Replace any bspwm config with ours
mkdir -p $HOME/.config/bspwm/
rm -f "$HOME/.config/bspwm/bspwmrc"
cp -f "/usr/share/AlanDE/bspwm/bspwmrc" "$HOME/.config/bspwm/bspwmrc"

# Replace any sxhkd config with ours
mkdir -p $HOME/.config/sxhkd/
rm -f "$HOME/.config/sxhkd/sxhkdrc"
cp -f "/usr/share/AlanDE/sxhkd/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"

# Copy over Unison synchronisation profiles
mkdir -p $HOME/.unison/
cp -f /usr/share/AlanDE/unison/* "$HOME/.unison/"

# Replace picom config file
sudo rm -f "/etc/xdg/picom.conf"
cp -f "/usr/share/AlanDE/picom/picom.conf" "/etc/xdg/picom.conf"