# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xorg-meson

DESCRIPTION="X.Org fontenc library"

KEYWORDS="*"

RDEPEND="virtual/zlib:="
DEPEND="${RDEPEND}
	x11-base/xorg-proto"

src_configure() {
	local XORG_CONFIGURE_OPTIONS=(
		-Dwith-encodingsdir="${EPREFIX}/usr/share/fonts/encodings"
	)
	xorg-meson_src_configure
}
