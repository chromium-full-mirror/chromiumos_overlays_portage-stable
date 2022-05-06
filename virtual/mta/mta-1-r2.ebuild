# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for Message Transfer Agents"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="*"

RDEPEND="|| (	mail-mta/nullmailer
				mail-mta/msmtp[mta]
				mail-mta/ssmtp[mta]
				mail-mta/courier
				mail-mta/esmtp
				mail-mta/exim
				mail-mta/netqmail
				mail-mta/notqmail
				mail-mta/postfix
				mail-mta/sendmail
				mail-mta/opensmtpd[mta] )"
