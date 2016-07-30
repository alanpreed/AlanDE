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
	install -d $pkgdir/usr/share/AlanDE/wallpapers/
	cp -r wallpapers/. $pkgdir/usr/share/AlanDE/wallpapers/

	install -d $pkgdir/etc/xdg/{lxsession,pcmanfm,lxpanel}/AlanDE
	cp -r configs/lxsession/. $pkgdir/etc/xdg/lxsession/AlanDE/
	cp -r configs/pcmanfm/. $pkgdir/etc/xdg/pcmanfm/AlanDE/
	cp -r configs/lxpanel/. $pkgdir/etc/xdg/lxpanel/AlanDE/
	
	install -d $pkgdir/etc/xdg/libfm/AlanDE
	cp -r configs/libfm/. $pkgdir/etc/xdg/libfm/AlanDE/

	install -d $pkgdir/etc/xdg/synapse/AlanDE
	cp -r configs/synapse/. $pkgdir/etc/xdg/synapse/AlanDE/

	install -d $pkgdir/etc/xdg/openbox/AlanDE
	cp -fr configs/openbox/. $pkgdir/etc/xdg/openbox/AlanDE

	install -d $pkgdir/usr/share/xsessions
	cp -r configs/xsession/. $pkgdir/usr/share/xsessions

	install -d $pkgdir/usr/share/glib-2.0/schemas
	cp -fr configs/metacity/. $pkgdir/usr/share/glib-2.0/schemas/

	install -d %pkgdir/etc/gtkrc-2/
	cp -fr configs/gtk2/. $pkgdir/etc/gtkrc-2.0/

	install -d %pkgdir/etc/gtk-3.0/
	cp -fr configs/gtk3/. $pkgdir/etc/gtk-3.0/

	install -d $pkgdir/etc/lightdm/AlanDE
	cp -fr configs/lightdm/. $pkgdir/etc/lightdm/AlanDE

	install -d $pkgdir/usr/share/applications
	cp -fr configs/desktop_entries/. $pkgdir/usr/share/applications/
}
