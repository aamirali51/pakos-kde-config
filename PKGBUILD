# Maintainer: DarkXero <info@techxero.com>
pkgname=pakos-kde-config
_destname1="/etc"
pkgver=1.1
pkgrel=2
pkgdesc="Desktop Config for PAKOS"
arch=('any')
url="https://github.com/aamirali51"
license=('GPL3')
makedepends=('git')
conflicts=()
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${pkgname}::"git+${url}/${pkgname}")
sha256sums=('SKIP')
package() {
	install -dm755 ${pkgdir}${_destname1}
	cp -r ${srcdir}/${pkgname}${_destname1}/* ${pkgdir}${_destname1}
	rm ${srcdir}/${pkgname}/PKGBUILD

}
