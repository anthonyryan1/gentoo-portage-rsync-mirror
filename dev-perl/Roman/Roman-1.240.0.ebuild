# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Roman/Roman-1.240.0.ebuild,v 1.1 2015/03/17 17:27:23 monsieurp Exp $

EAPI=5

MODULE_AUTHOR=CHORNY
MODULE_VERSION=1.24
MODULE_A_EXT=tar.gz

inherit perl-module

DESCRIPTION="Perl module for conversion between Roman and Arabic numerals"

SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~mips ~s390 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)"

SRC_TEST="do parallel"
