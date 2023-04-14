# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=bdepend
PYTHON_COMPAT=( python3_6 pypy3 )
inherit distutils-r1

DESCRIPTION="A backport of the dataclasses module for Python 3.6"
HOMEPAGE="https://github.com/ericvsmith/dataclasses"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]"
