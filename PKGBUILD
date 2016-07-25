# This package should install (as dependencies) and configure all of the software that makes up Alan's DE.

# Maintainer: Alan Reed
pkgname=AlanDE-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1
pkgrel=1
pkgdesc="Alan's Desktop Environment"
arch=('x86_64')
license=('unknown')

depends=()

makedepends=('git') 
provides=("${pkgname%-git}")
install=
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
	install -d $pkgdir/etc/xdg/{lxsession,pcmanfm,lxpanel}/AlanDE

	install -d $pkgdir/usr/share/xsessions

	cp -r wallpapers/. $pkgdir/usr/share/AlanDE/wallpapers/
	cp -r configs/lxsession/. $pkgdir/etc/xdg/lxsession/AlanDE/
	cp -r configs/pcmanfm/. $pkgdir/etc/xdg/pcmanfm/AlanDE/
	cp -r configs/xsession/. $pkgdir/usr/share/xsessions
	cp -r configs/lxpanel/. $pkgdir/etc/xdg/lxpanel/AlanDE/
	cp -fr configs/gtk2/. $pkgdir/etc/gtkrc-2.0/
	cp -fr configs/gtk3/. $pkgdir/etc/gtk-3.0/
	cp -fr configs/openbox/. $pkgdir/etc/xdg/openbox/
	cp -fr configs/lightdm/. $pkgdir/etc/lightdm
}
