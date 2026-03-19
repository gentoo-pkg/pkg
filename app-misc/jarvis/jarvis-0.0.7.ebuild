# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# clean → fetch → unpack → prepare → configure → compile → test → install

EAPI=8

inherit cmake

DESCRIPTION="Jarvis"
HOMEPAGE="https://github.com/dingjingmaster/jarvis"
SRC_URI="https://github.com/dingjingmaster/jarvis/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# 源码解压目录
S="${WORKDIR}/${P}"

src_prepare() {
	default
}

src_configure() {
	local buildDir="${WORKDIR}/${P}-build"
	mkdir -p ${buildDir}

	cd ${buildDir} || die "Cannot enter build dir!"

	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
	)

	#
	cmake "${S}" "${mycmakeargs[@]}" || "CMake configure failed!"
	default
}

src_compile() {
	cd "${WORKDIR}/${P}-build" || die
	make -j ${nproc} || die
}

src_install() {
	elog "install..."
}

pkg_postinst() {
	elog "postinstall..."
}
