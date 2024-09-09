# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 7 -- sys-apps/portage dep
EAPI=7

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1

DESCRIPTION="Simplified packaging of Python modules (core module)"
HOMEPAGE="
	https://pypi.org/project/flit-core/
	https://github.com/pypa/flit/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/flit_core-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	!dev-python/flit_core
	dev-python/tomli[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/testpath[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_unpack() {
	default_src_unpack
	mv flit_core-${PV} flit-core-${PV}
}

src_prepare() {
	rm -r flit_core/vendor || die
	sed -i -e 's:from \.vendor ::' flit_core/*.py || die
	distutils-r1_src_prepare
}
