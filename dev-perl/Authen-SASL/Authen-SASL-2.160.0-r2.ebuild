# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR=GBARR
DIST_VERSION=2.16
inherit perl-module

DESCRIPTION="A Perl SASL interface"

SLOT="0"
KEYWORDS="*"
IUSE="kerberos test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-perl/Digest-HMAC
	virtual/perl-Digest-MD5
	kerberos? ( dev-perl/GSSAPI )
"
BDEPEND="${DEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.42
	test? (
		virtual/perl-Test-Simple
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-2.16-no-dot-inc.patch"
)
