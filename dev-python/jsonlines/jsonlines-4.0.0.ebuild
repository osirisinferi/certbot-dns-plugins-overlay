# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Library with helpers for the jsonlines file format"
HOMEPAGE="https://jsonlines.readthedocs.org/ https://pypi.org/project/jsonlines/ https://github.com/wbolster/jsonlines/"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-python/attrs-19.2.0"
