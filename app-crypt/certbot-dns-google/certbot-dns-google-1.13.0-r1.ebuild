# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python3_{6,7,8,9})
DISTUTILS_USE_SETUPTOOLS=rdepend

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/certbot/certbot.git"
	inherit git-r3
	S=${WORKDIR}/${P}/${PN}
else
	SRC_URI="https://github.com/certbot/certbot/archive/v${PV}.tar.gz -> certbot-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S=${WORKDIR}/certbot-${PV}/${PN}
fi

inherit distutils-r1

DESCRIPTION="Google Cloud DNS plugin for Certbot (Let's Encrypt Client)"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND=">=app-crypt/certbot-1.1.0[${PYTHON_USEDEP}]
	>=app-crypt/acme-0.29.0[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-1.5.5[${PYTHON_USEDEP}]
	>=dev-python/oauth2client-4.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]"
