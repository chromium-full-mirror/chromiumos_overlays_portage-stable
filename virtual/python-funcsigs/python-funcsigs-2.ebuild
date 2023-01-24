# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6..9} pypy3 )

inherit python-r1

DESCRIPTION="A Virtual for Python function signatures from PEP362 (py3.6 variant)"
SLOT="0"
KEYWORDS="*"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '>=dev-python/funcsigs-1[${PYTHON_USEDEP}]' python3_{3,4,5} pypy{,3} )"
