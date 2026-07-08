# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Command line utilities to work with desktop menu entries"
HOMEPAGE="https://freedesktop.org/wiki/Software/desktop-file-utils/"
SRC_URI="https://www.freedesktop.org/software/${PN}/releases/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"

RDEPEND=">=dev-libs/glib-2.26:2"
DEPEND="${RDEPEND}"
BDEPEND="
	app-arch/xz-utils
	virtual/pkgconfig
"

DOCS=( AUTHORS ChangeLog HACKING NEWS README )

src_install() {
	meson_src_install

	# Part of app-emacs/desktop-entry-mode instead
	rm -r "${ED}"/usr/share/emacs || die
}
