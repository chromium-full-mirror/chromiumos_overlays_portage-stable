# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3_{6..9} )
inherit cmake-multilib python-any-r1

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/KhronosGroup/${PN}.git"
	inherit git-r3
else
	SNAPSHOT_COMMIT="sdk-${PV}.0"
	SRC_URI="https://github.com/KhronosGroup/${PN}/archive/${SNAPSHOT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
	S="${WORKDIR}/${PN}-${SNAPSHOT_COMMIT}"
fi

DESCRIPTION="Khronos reference front-end for GLSL and ESSL, and sample SPIR-V generator"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/ https://github.com/KhronosGroup/glslang"

LICENSE="BSD"
SLOT="0"

BDEPEND="${PYTHON_DEPS}"

# Bug 698850
RESTRICT="test"

multilib_src_configure() {
	# CHROMIUM(b/259102548): Disable generation of pre-compiled headers
	# because they break the build if Portage reinstalls linux-headers
	# while building this package. The build fails because the mtime of
	# errno.h is newer than cmake_pch.hxx.pch.
	local mycmakeargs=(
		"-DENABLE_PCH=OFF"
	)

	cmake_src_configure
}
