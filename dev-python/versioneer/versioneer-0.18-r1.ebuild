# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..12} )
inherit distutils-r1

DESCRIPTION="Easy VCS-based management of project version strings"
HOMEPAGE="https://pypi.org/project/versioneer/ https://github.com/warner/python-versioneer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="public-domain"
KEYWORDS="*"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
