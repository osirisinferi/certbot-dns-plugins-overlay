# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="python-${PN}"

PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Python wrapper for the Cloudflare v4 API"
HOMEPAGE="https://pypi.org/project/cloudflare/"
SRC_URI="https://github.com/cloudflare/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/python-${P}"

DEPEND="dev-python/jsonlines[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	dev-python/future[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]"
BDEPEND=""

python_prepare_all() {
	sed -r -e "/packages *=/ s|\[[^]]*\]\+||" -i -- setup.py

	rm -r examples

	distutils-r1_python_prepare_all
}
