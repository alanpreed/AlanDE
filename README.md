# Alan's Desktop Environment

With this project, I am trying to collect together and configure a range of software to form a cohesive desktop environment on Arch Linux.  The software that I have selected is listed below.

## Core Software
- Display manager:
  - LightDM, with GTK Greeter to provide consistent theming
- Window manager:
  - i3, with Compton for compositing
- Session manager:
  - Lxsession, provides privilege escalation and a clipboard in addition to autostarting required programs.
- Theme
  - Numix Dark, with the Numix Circle icon theme
- Fonts
  - Noto fonts + emojis (for extra character support)
- Desktop panel
  - Lxpanel
- Application launcher:
  - Synapse, though only one of its themes doesn't glitch out when the down arrow is pressed.
- Terminal emulator:
  - Terminology
- File manager:
  - PCManFM, with xarchiver and other packages to add support for archives, MTP (Android) devices, NTFS drives.  Run as a daemon to      handle automounting external drives.
- Networking:
  - Connman, with connman-gtk to provide a GUI and tray icon.
- Sound:
  - Pulseaudio, with pavucontrol to allow per-application volume adjustment


## Extras
- Vivaldi
- Visual Studio Code
- xbindkeys
- gnome-screenshot
- gpic-viewer

