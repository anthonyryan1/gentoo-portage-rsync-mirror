# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-frameworks/kglobalaccel/kglobalaccel-5.12.0.ebuild,v 1.1 2015/07/16 20:33:12 johu Exp $

EAPI=5

VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework to handle global shortcuts"
KEYWORDS="~amd64 ~x86"
LICENSE="LGPL-2+"
IUSE="nls"

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kwindowsystem X)
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
	!<kde-plasma/plasma-workspace-5.2.0-r2
"
DEPEND="${RDEPEND}
	nls? ( dev-qt/linguist-tools:5 )
"
