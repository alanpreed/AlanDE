# This package should install (as dependencies) and configure all of the software that makes up Alan's DE.

# Maintainer: Alan Reed
pkgname=AlanDE-git
pkgver=r48.6e76545
pkgrel=1
pkgdesc="Alan's Desktop Environment"
arch=('x86_64')
license=('unknown')

depends=()

makedepends=('git') 
provides=("${pkgname%-git}")
install="${pkgname%-git}.install"


pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available (from example PKGBUILD)
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Create a symlink so that we can use the local git repository
	ln -snf "$startdir" "$srcdir/${pkgname%-git}"
}


package() {
	cd "$srcdir/${pkgname%-git}"

	# Wallpaper for LightDM and PCManFM
	install -d $pkgdir/usr/share/AlanDE/wallpapers/
	cp -r wallpapers/. $pkgdir/usr/share/AlanDE/wallpapers/

	# Applications that use xdg config profiles
	install -d $pkgdir/etc/xdg/lxsession/AlanDE
	cp -r configs/lxsession/. $pkgdir/etc/xdg/lxsession/AlanDE/

	install -d $pkgdir/etc/xdg/pcmanfm/AlanDE
	cp -r configs/pcmanfm/. $pkgdir/etc/xdg/pcmanfm/AlanDE/

	install -d $pkgdir/etc/xdg/lxpanel/AlanDE
	cp -r configs/lxpanel/. $pkgdir/etc/xdg/lxpanel/AlanDE/

	# Xsession config (autostart lxsession)
	install -d $pkgdir/usr/share/xsessions
	cp -r configs/xsession/. $pkgdir/usr/share/xsessions

	# Gschema files (for connman-gtk configuration)
	install -d $pkgdir/usr/share/glib-2.0/schemas
	cp -fr configs/gschema/. $pkgdir/usr/share/glib-2.0/schemas/

	# GTK 2 and 3 config files
	install -d %pkgdir/etc/gtkrc-2/
	cp -fr configs/gtk2/. $pkgdir/etc/gtkrc-2.0/

	install -d %pkgdir/etc/gtk-3.0/
	cp -fr configs/gtk3/. $pkgdir/etc/gtk-3.0/

	#QT4 config
	install -d %pkgdir/etc/xdg/
	cp -fr configs/qt4/. $pkgdir/etc/xdg/

	# .desktop entries (lock and logout)
	install -d $pkgdir/usr/share/applications/
	cp -fr configs/desktop_entries/. $pkgdir/usr/share/applications/

	# Font settings
	install -d $pkgdir/etc/fonts/conf.avail/
	install -d $pkgdir/etc/fonts/conf.d/
	cp -fr configs/fontconfig/. $pkgdir/etc/fonts/conf.avail/
	ln -s "/etc/fonts/conf.avail/52-alande-fonts.conf" "${pkgdir}/etc/fonts/conf.d/52-alande-fonts.conf"

	# Change default editor to nano
	install -d $pkgdir/etc/profile.d/
	cp -fr configs/profile/. $pkgdir/etc/profile.d/

	# Clementine running script
	install -d $pkgdir/usr/share/AlanDE/clementine
	cp -fr configs/clementine/. $pkgdir/usr/share/AlanDE/clementine/

	# Rofi default config
	install -d $pkgdir/etc/
	cp -fr configs/rofi/. $pkgdir/etc/

	# These applications don't have a system-wide config override, and so
	# require hacks post-install to make them use the AlanDE config files
	install -d $pkgdir/usr/share/AlanDE/libfm
	cp -r configs/libfm/. $pkgdir/usr/share/AlanDE/libfm

	install -d $pkgdir/usr/share/AlanDE/lightdm
	cp -fr configs/lightdm/. $pkgdir/usr/share/AlanDE/lightdm

	install -d $pkgdir/usr/share/AlanDE/terminator
	cp -fr configs/terminator/. $pkgdir/usr/share/AlanDE/terminator

	install -d $pkgdir/usr/share/AlanDE/bspwm
	cp -fr configs/bspwm/. $pkgdir/usr/share/AlanDE/bspwm/

	install -d $pkgdir/usr/share/AlanDE/sxhkd
	cp -fr configs/sxhkd/. $pkgdir/usr/share/AlanDE/sxhkd/
}
