# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for ${PN#perl-}"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	~perl-core/${PN#perl-}-${PV}
"

# this is the dev-lang/perl-5.44 version but we want the security patches
