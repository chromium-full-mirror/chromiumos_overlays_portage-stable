# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/"
EGIT_COMMIT="f027d53ded7e230e008d37c8b47ede7cd308e19d"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="!<x11-drivers/opengles-headers-0.0.1-r35"
DEPEND="${RDEPEND}"

S="${WORKDIR}/SPIRV-Headers-${EGIT_COMMIT}"
