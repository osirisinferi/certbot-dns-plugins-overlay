# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for the Cloudflare v4 API"
HOMEPAGE="https://pypi.org/project/cloudflare/ https://github.com/cloudflare/python-cloudflare"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/jsonlines[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	>=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"
BDEPEND=""

python_prepare_all() {
	sed -r -e "/packages *=/ s|\[.*\]|['CloudFlare', 'cli4']|" -i -- setup.py

	rm -r examples

	distutils-r1_python_prepare_all
}
