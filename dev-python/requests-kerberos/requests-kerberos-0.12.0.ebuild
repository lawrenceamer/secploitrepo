# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="A Kerberos authentication handler for python-requests"
HOMEPAGE="https://github.com/requests/requests-kerberos"
SRC_URI="https://github.com/requests/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE="test"

#DEPEND="test? (
#			dev-python/mock[${PYTHON_USEDEP}]
#			dev-python/requests-mock[${PYTHON_USEDEP}]
#		)"
RDEPEND="
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pykerberos-1.1.8[${PYTHON_USEDEP}] <dev-python/pykerberos-2.0.0"

python_test() {
	esetup.py test
}
