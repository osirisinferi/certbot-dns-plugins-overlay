# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Library with helpers for the jsonlines file format"
HOMEPAGE="https://jsonlines.readthedocs.org/ https://pypi.org/project/jsonlines/ https://github.com/wbolster/jsonlines/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

CDEPEND=">=dev-python/setuptools-1.0[${PYTHON_USEDEP}]"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}"
