# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/gitolite/gitolite-2.3.1-r1.ebuild,v 1.1 2014/11/03 10:23:32 zlogene Exp $

EAPI=5

inherit perl-module user

DESCRIPTION="Highly flexible server for git directory version tracker"
HOMEPAGE="http://github.com/sitaramc/gitolite"
SRC_URI="http://milki.github.com/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="contrib vim-syntax"

DEPEND="dev-lang/perl
	virtual/perl-File-Path
	virtual/perl-File-Temp
	>=dev-vcs/git-1.6.6"
RDEPEND="${DEPEND}
	!dev-vcs/gitolite-gentoo
	vim-syntax? ( app-vim/gitolite-syntax )"

pkg_setup() {
	enewgroup git
	enewuser git -1 /bin/sh /var/lib/gitolite git
}

src_prepare() {
	rm Makefile doc/COPYING || die
	rm -rf contrib/{gitweb,vim} || die

	echo "${PF}" > conf/VERSION
}

src_install() {
	local gl_bin="${D}/usr/bin"
	gl_bin=${gl_bin/\/\//\/}

	dodir /usr/share/gitolite/{conf,hooks} /usr/bin || die

	# install using upstream method
	export PATH="${gl_bin}:${PATH}"
	./src/gl-system-install ${gl_bin} \
		"${D}"/usr/share/gitolite/conf "${D}"/usr/share/gitolite/hooks || die
	sed -i -e "s:${D}::g" "${D}/usr/bin/gl-setup" \
		"${D}/usr/share/gitolite/conf/example.gitolite.rc" || die

	rm "${D}"/usr/bin/*.pm
	insinto "${VENDOR_LIB}"
	doins src/*.pm || die

	dodoc README.mkd doc/*

	if use contrib; then
		insinto /usr/share/doc/${PF}
		doins -r contrib/ || die
	fi

	keepdir /var/lib/gitolite
	fowners git:git /var/lib/gitolite
	fperms 750 /var/lib/gitolite
}

pkg_postinst() {
	# bug 352291
	ewarn
	elog "Please make sure that your 'git' user has the correct homedir (/var/lib/gitolite)."
	elog "Especially if you're migrating from gitosis."
	ewarn
}
