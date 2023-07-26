# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic toolchain-funcs

DESCRIPTION="Debian Almquist Shell"
HOMEPAGE="http://gondor.apana.org.au/~herbert/dash/"
SRC_URI="http://gondor.apana.org.au/~herbert/dash/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="libedit static vanilla"

RDEPEND="!static? ( libedit? ( dev-libs/libedit ) )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	libedit? ( static? ( dev-libs/libedit[static-libs] ) )"

PATCHES=( "${FILESDIR}"/${PN}-0.5.9.1-format-security.patch )

src_prepare() {
	#337329 #527848
	use vanilla ||  eapply "${FILESDIR}"/${PN}-0.5.9.1-dumb-echo.patch

	default

	# Fix the invalid sort
	sed -i -e 's/LC_COLLATE=C/LC_ALL=C/g' src/mkbuiltins

	# Use pkg-config for libedit linkage
	sed -i \
		-e "/LIBS/s:-ledit:\`$(tc-getPKG_CONFIG) --libs libedit $(usex static --static '')\`:" \
		configure || die
}

src_configure() {
	# don't redefine stat on Solaris
	if [[ ${CHOST} == *-solaris* ]] ; then
		export ac_cv_func_stat64=yes
	fi
	append-cppflags -DJOBS=$(usex libedit 1 0)
	use static && append-ldflags -static
	# Do not pass --enable-glob due to #443552.
	# Autotools use $LINENO as a proxy for extended debug support
	# (i.e. they're running bash), so disable that. #527644
	local myeconfargs=(
		CC_FOR_BUILD="$(tc-getBUILD_CC)"
		--bindir="${EPREFIX}"/bin
		--enable-fnmatch
		--disable-lineno
		$(use_with libedit)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default
	if [[ -n "${DEB_PATCH}" ]] ; then
		dodoc */debian/changelog
	fi
}
