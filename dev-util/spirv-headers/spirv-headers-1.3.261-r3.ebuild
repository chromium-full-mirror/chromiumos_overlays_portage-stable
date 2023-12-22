# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://registry.khronos.org/SPIR-V/"
EGIT_COMMIT="sdk-${PV}"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/SPIRV-Headers-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

PATCHES=(
	"${FILESDIR}/GITHUB-4183b26-ClspvReflection_add_NormalizedSamplerMaskPushConstant.patch"
	"${FILESDIR}/GITHUB-d5acd42-Update_SPV_INTEL_long_composites_tokens.patch"
	"${FILESDIR}/GITHUB-PR-398-vksp_header.patch"
)
