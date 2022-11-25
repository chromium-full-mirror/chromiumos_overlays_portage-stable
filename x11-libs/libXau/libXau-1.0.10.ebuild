# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

XORG_DOC=doc
XORG_MULTILIB=yes
XORG_TARBALL_SUFFIX="xz"
inherit xorg-3 flag-o-matic

DESCRIPTION="X.Org X authorization library"

KEYWORDS="*"

DEPEND="x11-base/xorg-proto"

src_configure() {
	append-lfs-flags
	xorg-3_src_configure
}
