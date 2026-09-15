# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR=RURBAN
DIST_VERSION=4.41
DIST_EXAMPLES=("eg/*")
inherit perl-module

DESCRIPTION="cPanel fork of JSON::XS, fast and correct serializing"

SLOT="0"
KEYWORDS="*"

RDEPEND="
	>=virtual/perl-Math-BigInt-1.160.0
	>=virtual/perl-Encode-1.980.100
	>=virtual/perl-podlators-2.80.0
"
BDEPEND="
	${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"
