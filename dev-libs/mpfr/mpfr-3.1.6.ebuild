# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

# NOTE: we cannot depend on autotools here starting with gcc-4.3.x
inherit eutils libtool multilib-minimal

MY_PV=${PV/_p*}
MY_P=${PN}-${MY_PV}
PLEVEL=${PV/*p}
DESCRIPTION="library for multiple-precision floating-point computations with exact rounding"
HOMEPAGE="https://www.mpfr.org/"
SRC_URI="https://www.mpfr.org/mpfr-${MY_PV}/${MY_P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0/4" # libmpfr.so version
KEYWORDS="*"
IUSE="static-libs"

RDEPEND=">=dev-libs/gmp-4.1.4-r2[${MULTILIB_USEDEP},static-libs?]"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	if [[ ${PLEVEL} != ${PV} ]] ; then
		local i
		for (( i = 1; i <= PLEVEL; ++i )) ; do
			eapply "${FILESDIR}"/${MY_PV}/patch$(printf '%02d' ${i})
		done
	fi
	default
	find . -type f -exec touch -r configure {} +
	elibtoolize
}

multilib_src_configure() {
	# Make sure mpfr doesn't go probing toolchains it shouldn't #476336#19
	ECONF_SOURCE=${S} \
	user_redefine_cc=yes \
	econf \
		--docdir="\$(datarootdir)/doc/${PF}" \
		$(use_enable static-libs static)
}

multilib_src_install_all() {
	use static-libs || find "${ED}"/usr -name '*.la' -delete

	# clean up html/license install
	pushd "${ED}"/usr/share/doc/${PF} >/dev/null || die
	rm COPYING* *.html
	popd >/dev/null || die
}
