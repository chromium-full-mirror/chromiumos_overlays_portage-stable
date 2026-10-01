# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
XORG_MULTILIB=yes
inherit xorg-meson

DESCRIPTION="X.Org xkbfile library"

KEYWORDS="*"

RDEPEND="x11-libs/libX11[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"
