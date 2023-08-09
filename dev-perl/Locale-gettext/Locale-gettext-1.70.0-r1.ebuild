# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_NAME=gettext
DIST_AUTHOR=PVANDRY
DIST_VERSION=1.07
inherit perl-module

DESCRIPTION="A Perl module for accessing the GNU locale utilities"

SLOT="0"
KEYWORDS="*"

RDEPEND="
	sys-devel/gettext
"
BDEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"

PATCHES=("${FILESDIR}/${P}-no-dot-inc.patch")

S="${WORKDIR}/${PN}-${DIST_VERSION}"
