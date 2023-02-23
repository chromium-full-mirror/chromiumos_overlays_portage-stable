# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{6..9} pypy3 )

inherit distutils-r1

DESCRIPTION="Simple, fast, extensible JSON encoder/decoder for Python"
HOMEPAGE="
	https://github.com/simplejson/simplejson/
	https://pypi.org/project/simplejson/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="|| ( MIT AFL-2.1 )"
SLOT="0"
KEYWORDS="*"

DOCS=( README.rst CHANGES.txt )

distutils_enable_tests unittest
