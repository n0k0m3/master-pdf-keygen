# Maintainer: Patrick Goetz <pgoetz at mail dot utexas dot edu>
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Ferik <djferik at gmail dot com>
# Contributor: n0k0m3

pkgname=masterpdfeditor
pkgver=5.6.80
pkgrel=1
pkgdesc='A complete solution for viewing, creating and editing PDF files'
url='https://code-industry.net/free-pdf-editor/'
arch=('x86_64')
license=('custom')
makedepends=('patchelf')
source_x86_64=("file://master-pdf-editor-5.6.80-qt5.x86_64.tar.gz"
               "file://net.code-industry.masterpdfeditor5.desktop")
sha1sums_x86_64=('0225cccbda7a3d0b7a6041c64cbda6f997d3095d'
                 'a588bba458bb2199d0a1f1dc5d96880614194f55')

package() {
  depends=('libgl' 'nspr' 'nss' 'qt5-base' 'qt5-svg' 'sane')

  install -d "$pkgdir"{/opt/,/usr/bin/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"

  cd "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}"
  ln -sr masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  cp ${srcdir}/net.code-industry.masterpdfeditor${pkgver%%.*}.desktop .
  install -Dm644 net.code-industry.masterpdfeditor${pkgver%%.*}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  patchelf --remove-rpath masterpdfeditor${pkgver%%.*}
}

