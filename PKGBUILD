# This package should install (as dependencies) and configure all of the software that makes up Alan's DE.

# Maintainer: Alan Reed
pkgname=AlanDE-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r48.6e76545
pkgrel=1
pkgdesc="Alan's Desktop Environment"
arch=('x86_64')
license=('unknown')

depends=()

makedepends=('git') 
provides=("${pkgname%-git}")
install="${pkgname%-git}.install"

source=('git+https://github.com/alanpreed/AlanDE.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available (from example PKGBUILD)
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

	# Xsession config
	install -d $pkgdir/usr/share/xsessions
	cp -r configs/xsession/. $pkgdir/usr/share/xsessions

	# Gschema files (for Metacity)
	install -d $pkgdir/usr/share/glib-2.0/schemas
	cp -fr configs/metacity/. $pkgdir/usr/share/glib-2.0/schemas/

	# GTK 2 and 3 config files
	install -d %pkgdir/etc/gtkrc-2/
	cp -fr configs/gtk2/. $pkgdir/etc/gtkrc-2.0/

	install -d %pkgdir/etc/gtk-3.0/
	cp -fr configs/gtk3/. $pkgdir/etc/gtk-3.0/

	# .desktop entries
	install -d $pkgdir/usr/share/applications
	cp -fr configs/desktop_entries/. $pkgdir/usr/share/applications/

	# These applications don't have a system-wide config override, and so
	# require hacks post-install to make them use the AlanDE config files
	install -d $pkgdir/usr/share/AlanDE/libfm
	cp -r configs/libfm/. $pkgdir/usr/share/AlanDE/libfm

	install -d $pkgdir/usr/share/AlanDE/synapse
	cp -r configs/synapse/. $pkgdir/usr/share/AlanDE/synapse

	install -d $pkgdir/usr/share/AlanDE/lightdm
	cp -fr configs/lightdm/. $pkgdir/usr/share/AlanDE/lightdm

	install -d $pkgdir/usr/share/AlanDE/terminator
	cp -fr configs/terminator/. $pkgdir/usr/share/AlanDE/terminator

	install -d $pkgdir/usr/share/AlanDE/xbindkeys
	cp -fr configs/xbindkeys/. $pkgdir/usr/share/AlanDE/xbindkeys/
}
