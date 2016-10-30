# Alan's Desktop Environment

With this project, I am trying to collect together and configure a range of software to form a cohesive desktop environment on Arch Linux.  The software that I have selected is outlined below, along with current issues.

## Included Software
- Metacity
  - This is the window manager I have chosen to use.  It has relatively few dependencies, and works with GTK themes.  In addition, it does its own compositing which removes the need for additional software such as Compton.
- Numix Theme
  - I have chosen to use the Numix Dark theme, as I like its simple flat styling. It seems well maintained, and supports both GTK2 and GTK3.
- Numix Icon Theme and Numix Circle Icon Theme
  - These have a large range of modern icons that fit well with the Numix GTK theme.
- Noto Fonts
  - Finding a good font for Linux is something I've always found a bit of a challenge.  Noto seems like a decent one, although I haven't used it for very long.  DejaVu Sans is my current backup choice. 
- Lxsession
  - This is a lightweight session manager.  It handles autostarting programs for the desktop environment, as well as privilege escalation and a clipboard.  Currently I am using the git version of this, because the repository version doesn't contain several useful bugfixes/additions that are present in the git version.
- Lxpanel
  - This provides the panel at the bottom of the desktop, with important features such as a system tray and desktop pager.
- Synapse
  - I prefer to use a graphical launcher rather than a "Start" menu.  I very much like the Everything Launcher, but that is tied into Enlightenment.  Synapse is a decent replacement which seems to work well, though I've found that only one of the themes doesn't glitch out when the down arrow is pressed.
- Terminology
  - I've chosen this terminal emulator because it supports splitting/tiling the terminal, while also being easily customisable.
- PCManFM
  - I really like this file manager.  It has many useful features (when necessary packages are installed), such as support for MTP (Android) devices and compressed files.  I also use it for setting the desktop background.
- Connman
  - Seems to connect more reliably to networks than NetworkManager
- Lxrandr
  - A small, useful utility from LXDE which may be handy for configuring monitor setup
- Pulseaudio + Pavucontrol
  - Being able to adjust the volume of individual applications via the pavucontrol mixer is very useful.
- xbindkeys
  - Global keybindings for tasks such as taking a screenshot or using media keys are facilitated by this package.
- Gnome-screenshot
  - This is a handy little program for taking screenshots in various ways
- LightDM + GTK Greeter
  - This provides a login screen which fits with the GTK theme of the rest of the desktop
- Chromium
  - Standard web browser
- Gpic-viewer
  - This is a nice lightweight picture viewer
- Pinta
  - A simpler picture editor than GIMP, which is handy.
- Pluma
  - This is a customisable text editor, with useful features such as theming, syntax highlighting and multiple tabs

## Current Issues
The main problem at the moment is getting QT applications to integrate with the GTK theme.  I still haven't managed to get this working properly, so for now I have just avoided QT applications.  This is a shame, as there are some really nice ones - such as Clementine.
