# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/dleyna-connector-dbus/dleyna-connector-dbus-0.2.0.ebuild,v 1.1 2015/06/09 22:49:03 eva Exp $

EAPI=5

inherit eutils

DESCRIPTION="utility library for higher level dLeyna libraries"
HOMEPAGE="https://01.org/dleyna/"
SRC_URI="https://01.org/sites/default/files/downloads/dleyna/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="1.0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-libs/glib-2.28:2
	>=net-libs/dleyna-core-0.2.1:1.0
	>=sys-apps/dbus-1
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_install() {
	default
	prune_libtool_files
}
