# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

DESCRIPTION="userspace library that provides the programming interface to the user-space helper infrastructure"
HOMEPAGE="http://www.netfilter.org/projects/libnetfilter_cthelper"
SRC_URI="http://www.netfilter.org/projects/${PN}/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

RDEPEND="net-libs/libmnl"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${P}-attribute-order.patch
)
