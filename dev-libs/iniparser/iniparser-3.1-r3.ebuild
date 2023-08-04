# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

DESCRIPTION="A free stand-alone ini file parsing library"
HOMEPAGE="http://ndevilla.free.fr/iniparser/"
SRC_URI="http://ndevilla.free.fr/iniparser/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples"
# the tests are rather examples than tests, no point in running them
RESTRICT="test"

BDEPEND="doc? ( app-doc/doxygen )"

S="${WORKDIR}/${PN}"

PATCHES=(
	"${FILESDIR}"/${PN}-3.0b-cpp.patch
	"${FILESDIR}"/${PN}-3.0-autotools.patch
	"${FILESDIR}"/${PN}-4.0-out-of-bounds-read.patch
)

src_prepare() {
	default
	eautoreconf
}

src_install() {
	if use doc; then
		emake -C doc
		HTML_DOCS=( html/. )
	fi

	default

	if use examples; then
		docinto examples
		dodoc test/*.{c,ini,py}
		docompress -x /usr/share/doc/${PF}/examples
	fi

	# No static archives
	find "${ED}" -name '*.la' -delete || die
}
