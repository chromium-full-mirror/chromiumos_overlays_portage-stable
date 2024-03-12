# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=SPIRV-Tools
PYTHON_COMPAT=( python3_{8..12} )
PYTHON_REQ_USE="xml(+)"
inherit cmake-multilib python-any-r1

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/KhronosGroup/${MY_PN}.git"
	inherit git-r3
else
	EGIT_COMMIT="vulkan-sdk-${PV}.0"
	SRC_URI="https://github.com/KhronosGroup/${MY_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
	S="${WORKDIR}"/${MY_PN}-${EGIT_COMMIT}
fi

DESCRIPTION="Provides an API and commands for processing SPIR-V modules"
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-Tools"

LICENSE="Apache-2.0"
SLOT="0"
# Tests fail upon finding symbols that do not match a regular expression
# in the generated library. Easily hit with non-standard compiler flags
RESTRICT="test"

DEPEND="
	~dev-util/spirv-headers-${PV}
	~dev-util/vulkan-headers-${PV}
"
RDEPEND=""
BDEPEND="${PYTHON_DEPS}"

PATCHES=("${FILESDIR}/GITHUB-PR-5512-vksp_passes.patch")

multilib_src_configure() {
	local mycmakeargs=(
		-DSPIRV-Headers_SOURCE_DIR="${ESYSROOT}"/usr/
		-DSPIRV_WERROR=OFF
		-DSPIRV_TOOLS_BUILD_STATIC=OFF
	)
	# CHROMIUM (b/201531268): Enable LFS.
	append-lfs-flags
	cmake_src_configure
}

multilib_src_install() {
	# Install files needed by vksp
	local DIR="/usr/include/spirv-tools/vksp"
	dodir "${DIR}"
	insinto "${DIR}"
	doins "${BUILD_DIR}/extension_enum.inc"
	doins "${BUILD_DIR}/NonSemanticShaderDebugInfo100.h"
	doins "${BUILD_DIR}/OpenCLDebugInfo100.h"

	cmake_src_install
}
