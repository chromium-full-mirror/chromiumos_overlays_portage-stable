# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="test program for capturing input device events"
HOMEPAGE="https://cgit.freedesktop.org/evtest/"
SRC_URI="https://cgit.freedesktop.org/evtest/snapshot/${PN}-${P}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

BDEPEND="app-text/asciidoc
	app-text/xmlto
	virtual/pkgconfig"

S="${WORKDIR}/${PN}-${P}"

PATCHES=(
	"${FILESDIR}"/${P}-musl-include.patch
)

src_prepare() {
	default
	eautoreconf
}
