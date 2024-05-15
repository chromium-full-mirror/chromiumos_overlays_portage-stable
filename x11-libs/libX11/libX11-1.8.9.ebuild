# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

XORG_DOC=doc
XORG_MULTILIB=yes
XORG_TARBALL_SUFFIX=xz
inherit toolchain-funcs xorg-3

# Note: please bump this with x11-misc/compose-tables
DESCRIPTION="X.Org X11 library"

KEYWORDS="*"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=x11-libs/libxcb-1.11.1[${MULTILIB_USEDEP}]
	x11-misc/compose-tables

	!<xfce-base/xfce4-settings-4.16.3
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	x11-libs/xtrans
"
BDEPEND="test? ( dev-lang/perl )"

src_configure() {
	local XORG_CONFIGURE_OPTIONS=(
		$(use_with doc xmlto)
		$(use_enable doc specs)
		--enable-ipv6
		--without-fop
		--with-keysymdefdir="${ESYSROOT}/usr/include/X11"
		CPP="$(tc-getPROG CPP cpp)"
	)
	xorg-3_src_configure
}

src_install() {
	xorg-3_src_install
	rm -rf "${ED}"/usr/share/X11/locale || die
}
