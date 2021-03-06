# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/libcerf/libcerf-1.4.ebuild,v 1.1 2015/04/19 00:50:17 ottxor Exp $

EAPI=5

inherit autotools-utils

DESCRIPTION="library that provides an efficient and accurate implementation of complex error functions"
HOMEPAGE="http://apps.jcns.fz-juelich.de/doku/sc/libcerf"
SRC_URI="http://apps.jcns.fz-juelich.de/src/${PN}/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="doc static-libs test"

src_install() {
	autotools-utils_src_install
	mv "${ED}"/usr/share/man/man3/{,${PN}-}cerf.3 || die #collision with sys-apps/man-pages
	use doc || rm "${ED}"/usr/share/doc/${P}/*.html || die
}
