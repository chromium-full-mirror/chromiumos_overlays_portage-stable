# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for ${PN#perl-}"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	|| ( =dev-lang/perl-5.36* ~perl-core/${PN#perl-}-${PV} )
	dev-lang/perl:=
	!<perl-core/${PN#perl-}-${PV}
	!>perl-core/${PN#perl-}-${PV}-r999
	>=virtual/perl-Compress-Raw-Bzip2-2.103.0
	>=virtual/perl-Compress-Raw-Zlib-2.105.0
"
# Dependencies on Compress-Raw* must be kept in step
# but sometimes not .... use ${PV} when you can.
