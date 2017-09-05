# Alan's Desktop Environment

With this project, I am trying to collect together and configure a range of software to form a cohesive desktop environment on Arch Linux.

## Core Software
- Display manager:
  - LightDM, with GTK Greeter to provide consistent theming
- Window manager:
  - bspwm, with Compton for compositing
- Key bindings:
  - sxhkd
- Session manager:
  - Lxsession, provides privilege escalation and a clipboard in addition to autostarting required programs.
- Theme
  - Numix Dark, with the Numix Circle icon theme
- Fonts
  - Noto fonts + emojis + CJK (for extra character support)
- Desktop panel
  - Lxpanel
- Application launcher:
  - Rofi
- Terminal emulator:
  - Terminator
- File manager:
  - PCManFM, with xarchiver and other packages to add support for archives, MTP (Android) devices, NTFS drives.  Run as a daemon to      handle automounting external drives.
- Networking:
  - Connman, with connman-gtk to provide a GUI and tray icon.
- Sound:
  - Pulseaudio, with pavucontrol to allow per-application volume adjustment

## Extras
- Text editor:
  - Visual Studio Code
- Screenshot utility:
  - gnome-screenshot
- Simple image viewer:
  - gpic-viewer
- PDF viewer:
  - evince
- Video player:
  - mpv
- Music player:
  - Clementine

