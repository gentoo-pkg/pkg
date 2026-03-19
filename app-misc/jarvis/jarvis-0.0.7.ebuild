# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

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

	# 打补丁
	
	# 构建选项
}

src_configure() {
	local myCmakeArgs=(
		-DCMAKE_BUILD_TYPE=Release
		-B build
		-S .
		)
	cmake ${myCmakeArgs}
}

src_compile() {
	make -C build || die "Compilation failed!"
}

src_install() {
	elog "install..."
}

pkg_postinst() {
	# 
	elog "postinstall..."
}
