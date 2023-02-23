# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Python style guide checker (fka pep8)"
HOMEPAGE="
	https://pycodestyle.pycqa.org/en/latest/
	https://github.com/PyCQA/pycodestyle/
	https://pypi.org/project/pycodestyle/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme

python_test() {
	local -x PYTHONPATH=${S}
	"${EPYTHON}" pycodestyle.py -v --statistics pycodestyle.py || die "Tests failed with ${EPYTHON}"
	"${EPYTHON}" pycodestyle.py -v --max-doc-length=72 --testsuite=testsuite || die "Tests failed with ${EPYTHON}"
	"${EPYTHON}" pycodestyle.py --doctest -v || die "Tests failed with ${EPYTHON}"
}
