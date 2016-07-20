#! /bin/bash

# This script should install all of the prerequisite packages for AlanDE, 
# then invoke makepkg to install the common config files, and finally enable
# any required services for the DE.

# #AUR Dependencies:
 aur_list=('cower' 'pacaur' 	#AUR helper for convenience
 			'numix-icon-theme-git' 'numix-circle-icon-theme-git')	# Icon theme

repo_list=('openbox' 'compton'	#WM and compositor
			'numix-themes' 			# GTK theme
			'ttf-dejavu'			# Font
			'synapse'				# Application launcher
			'lxappearance' 'lxappearance-obconf'	# GTK theming GUI
			'lxpanel' 'lxinput' 'lxrandr' 'lxtask'
			'lxsession'		# Session manager
			'terminator'	# Terminal
			'lightdm' 'lightdm-gtk-greeter' 'lightdm-gtk-greeter-settings'	#Display manager
			'pulseaudio' 'pulseaudio-alsa' 'pavucontrol'	#Sound 
			'pcmanfm' 'gvfs' 'xarchiver' 'p7zip'			#File manager + extensions
			'midori' 'midori-flash'			# Web browser with flash
			)

aur_address='https://aur.archlinux.org/'

#Check that we have root access
if [ "$(whoami)" != "root" ]; then
	echo "Please run this as root!"
	exit 1
fi

#Check that pacman is available
if  !(hash pacman 2>/dev/null);  then
	echo "Pacman isn't installed, are you sure you're using Arch Linux?"
	exit 1
fi

echo "Updating repositories prior to installation."
pacman -Syu

#Make sure git is available for handling AUR packages
if  !(hash git 2>/dev/null);  then
	echo "Git not installed. Fixing:"
	pacman -S git
fi

# #Install AUR packages
for pkg in aur_list; do
	echo "Installing $pkg"
done