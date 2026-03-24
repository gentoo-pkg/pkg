# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# clean → fetch → unpack → prepare → configure → compile → test → install

EAPI=8

PYTHON_COMPAT=( python3_11 python3_12 )

DESCRIPTION="WenQu"
HOMEPAGE="https://github.com/dingjingmaster/WenQu"
SRC_URI="https://github.com/dingjingmaster/WenQu/archive/refs/tags/v${PV}.tar.gz -> WenQu-${PV}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/poetry"
RDEPEND="${DEPEND}"
BDEPEND=""


S="${WORKDIR}/WenQu-${PV}"

src_unpack() {
	elog "unpack: $S"
	default
}

src_install() {
	elog "install..."

	mkdir -p "$D/opt/WenQu"
	mkdir -p "$D/usr/share/applications"

	cp -ar ${WORKDIR}/WenQu-${PV}/* $D/opt/WenQu/ || die
	cp ${WORKDIR}/WenQu-${PV}/data/wenqu.sh $D/opt/WenQu/ || die
	cp ${WORKDIR}/WenQu-${PV}/data/WenQu.desktop $D/usr/share/applications/ || die
}

pkg_postinst() {
	elog "postinstall..."
	poetry -C /opt/WenQu install
	update-desktop-database
}
