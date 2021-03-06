# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Syntax-Keyword-Junction/Syntax-Keyword-Junction-0.3.8.ebuild,v 1.1 2015/02/21 22:18:31 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=FREW
MODULE_VERSION=0.003008
inherit perl-module

DESCRIPTION="Perl6 style Junction operators in Perl5"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-perl/Sub-Exporter-Progressive-0.1.6
	virtual/perl-parent
	dev-perl/syntax
"
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.300.0
	test? (
		>=virtual/perl-Test-Simple-0.880.0
		>=dev-perl/Test-Requires-0.70.0
	)
"
