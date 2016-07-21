# This package should install (as dependencies) and configure all of the software that makes up Alan's DE.

# Maintainer: Alan Reed
pkgname=AlanDE-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1
pkgrel=1
pkgdesc="Alan's Desktop Environment"
arch=('x86_64')
license=('unknown')

depends=()

makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
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
	install -d $pkgdir/usr/share/AlanDe/wallpapers/
	install -d $pkgdir/etc/xdg/{lxsession,pcmanfm,lxpanel}/AlanDE

	install -d $pkgdir/usr/share/xsessions

	cp -r wallpapers/. $pkgdir/usr/share/AlanDe/wallpapers/
	cp -r configs/lxsession/. $pkgdir/etc/xdg/lxsession/AlanDE/
	cp -r configs/pcmanfm/. $pkgdir/etc/xdg/pcmanfm/AlanDE/
	cp -r configs/xsession/. $pkgdir/usr/share/xsessions
	cp -r configs/lxpanel/. $pkgdir/etc/xdg/lxpanel/AlanDE/
}
