# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-java/selinux-java-2.20141203-r7.ebuild,v 1.1 2015/07/02 17:59:27 perfinion Exp $
EAPI="5"

IUSE="alsa"
MODS="java"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for java"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
