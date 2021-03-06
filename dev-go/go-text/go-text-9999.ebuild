# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-go/go-text/go-text-9999.ebuild,v 1.8 2015/07/06 17:10:56 williamh Exp $

EAPI=5

EGO_PN=golang.org/x/text/...
EGO_SRC=golang.org/x/text

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="df923bbb63f8ea3a26bb743e2a497abd0ab585f7"
	SRC_URI="https://github.com/golang/text/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi
inherit golang-build

DESCRIPTION="Go text processing support"
HOMEPAGE="https://godoc.org/golang.org/x/text"
LICENSE="BSD"
SLOT="0/${PV}"
IUSE=""
DEPEND=""
RDEPEND=""

if [[ ${PV} != *9999* ]]; then
src_unpack() {
	local f

	for f in ${A}
	do
		case "${f}" in
			*.tar|*.tar.gz|*.tar.bz2|*.tar.xz)
				local destdir=${WORKDIR}/${P}/src/${EGO_SRC}

				debug-print "${FUNCNAME}: unpacking ${f} to ${destdir}"

				# XXX: check whether the directory structure inside is
				# fine? i.e. if the tarball has actually a parent dir.
				mkdir -p "${destdir}" || die
				tar -C "${destdir}" -x --strip-components 1 \
					-f "${DISTDIR}/${f}" || die
				;;
			*)
				debug-print "${FUNCNAME}: falling back to unpack for ${f}"

				# fall back to the default method
				unpack "${f}"
				;;
		esac
	done
}
fi

src_test() {
	# Create a writable GOROOT in order to avoid sandbox violations.
	cp -sR "$(go env GOROOT)" "${T}/goroot" || die
	if [ -d "${T}/goroot/src/${EGO_SRC}" ]; then
		rm -rf "${T}/goroot/src/${EGO_SRC}" || die
	fi
	if [ -d "${T}/goroot/pkg/$(go env GOOS)_$(go env GOARCH)/${EGO_SRC}" ]; then
		rm -rf "${T}/goroot/pkg/$(go env GOOS)_$(go env GOARCH)/${EGO_SRC}" ||
			die
	fi

	# Create go symlink for TestLinking in display/dict_test.go
	mkdir -p "${T}/goroot/bin"
	ln -s /usr/bin/go  "${T}/goroot/bin/go" || die

	GOROOT="${T}/goroot" golang-build_src_test
}

src_install() {
	golang-build_src_install
	dobin bin/*
}
