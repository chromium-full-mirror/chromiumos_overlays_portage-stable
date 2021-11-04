# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=WBRASWELL
DIST_VERSION=1.21
DIST_EXAMPLES=( "Calc.yp" "YappParse.yp" )
inherit perl-module

DESCRIPTION="Compiles yacc-like LALR grammars to generate Perl OO parser modules"

SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="!<net-fs/samba-4.10.6"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"
mydoc="docs/*"

src_configure() {
	PERLVER=$(/usr/bin/perl -e "\$_ = \$^V; s/v//; print")
	PERL5LIBDIR="/usr/$(get_libdir)/perl5/vendor_perl/${PERLVER}"
	myconf="LIB=${PERL5LIBDIR}"
	perl-module_src_configure
}
