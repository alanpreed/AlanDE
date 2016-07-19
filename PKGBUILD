# This package should install (as dependencies) and configure all of the software that makes up Alan's DE.

# Maintainer: Alan Reed
pkgname=AlanDE-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1
pkgrel=1
pkgdesc="Alan's Desktop Environment"
arch=('x86_64')
license=('unknown')

depends=('openbox' 'compton'	#WM and compositor
			'numix-themes' 'numix-icon-theme-git' 'numix-circle-icon-theme-git' # GTK theme
			'ttf-dejavu'	# Font
			'synapse'		# Application launcher
			'lxappearance' 'lxappearance-obconf'	# GTK theming GUI
			'lxpanel' 'lxinput' 'lxrandr' 'lxtask'
			'lxsession'		# Session manager
			'terminator'	# Terminal
			'lightdm' 'lightdm-gtk-greeter' 'lightdm-gtk-greeter-settings'	#Display manager
			'pulseaudio' 'pulseaudio-alsa' 'pavucontrol'	#Sound 
			'pcmanfm' 'gvfs' 'xarchiver' 'p7zip'	#File manager dependencies
			'midori' 'midori-flash'		# Web browser with flash
 )

makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
install=$pkgname.install
source=('git+https://github.com/alanpreed/AlanDE.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available (from example PKGBUILD)
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
