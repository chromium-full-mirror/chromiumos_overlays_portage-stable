# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit toolchain-funcs

MY_P="${P//_/-}"
MY_RELEASEDATE="20170804"

SEPOL_VER="${PV}"

DESCRIPTION="SELinux Common Intermediate Language (CIL) Compiler"
HOMEPAGE="https://github.com/SELinuxProject/selinux/wiki"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/SELinuxProject/selinux.git"
	S="${WORKDIR}/${MY_P}/${PN}"
else
	SRC_URI="https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/${MY_RELEASEDATE}/${MY_P}.tar.gz"
	KEYWORDS="*"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	>=sys-libs/libsepol-${SEPOL_VER}
	"
RDEPEND="
	>=sys-libs/libsepol-${SEPOL_VER}
	"
BDEPEND="app-text/xmlto"

# tests are not meant to be run outside of the
# full SELinux userland repo
RESTRICT="test"

PATCHES=(
	"${FILESDIR}/secilc-2.7-add-ability-to-redeclare-types-attributes.patch"
)

src_configure() {
	tc-export CC
}
