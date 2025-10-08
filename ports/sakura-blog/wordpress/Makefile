# New ports collection makefile for:	wordpress
# Date created:		2010-03-01
# Whom:			SAKURA Internet Inc. <support@sakura.ad.jp>
#
# $FreeBSD$
#

PORTNAME=	wordpress
PORTVERSION=	6.8.2
CATEGORIES=	sakura-blog
DISTNAME=	${PORTNAME}-${PORTVERSION}-ja

MAINTAINER=	support@sakura.ad.jp
COMMENT=	${CGIURL}/index.php
WRKSRC=		${WRKDIR}/${DISTNAME}

# sakura-ports setting
INDEXDIR=	"${PREFIX}/${CGIDIR}"
NO_BUILD=	yes
FORCE_PKG_REGISTER=	yes
PLIST_SUB+=	CGIDIR="${CGIDIR}"

# pkg-sakura configure
CGISUBDIR?=	${PORTNAME}

# application setting
SUB_FILES=	pkg-message pkg-deinstall wp-config.php
SUB_LIST+=	CGISUBDIR="${CGISUBDIR}" \
		CGIDIR="${CGIDIR}" \
		CGIURL="${CGIURL}" \
		INDEXDIR="${INDEXDIR}" \
		DOMAIN="${DOMAIN}" \
		DBNAME="${DBNAME}" \
		DBUSER="${DBUSER}" \
		DBPASS="${DBPASS}" \
		DBHOST="${DBHOST}" \
		DBPREFIX="${DBPREFIX}"

do-stage:
	@${PKG_STAGE} ${WRKSRC} ${CGIDIR}
	@${NKF} -w ${WRKDIR}/wp-config.php > ${STAGEDIR}/${CGIDIR}/wp-config.php
	@${CP} ${WRKSRC}/.htaccess ${STAGEDIR}/${CGIDIR}/.htaccess

post-install:
	@if [ -n "$${ADMINNAME}" ]; then \
		/usr/local/bin/wp core install --path="${INDEXDIR}" \
					--url="$${CGIURL}" \
					--title="$${SITETITLE}" \
					--admin_user="$${ADMINNAME}" \
					--admin_email="$${ADMINMAILADDRESS}" \
					--admin_password="$${ADMINPASSWORD}" ; \
		/usr/local/bin/wp option update siteurl "$${CGIURL}" --path="${INDEXDIR}" ; \
		/usr/local/bin/wp option update home "$${CGIURL}" --path="${INDEXDIR}" ; \
		cd "${INDEXDIR}" && /usr/local/bin/wp rewrite flush --hard --path="${INDEXDIR}" ; \
	fi
	@if [ -n "$${ADMINNAME}" ] && [ -z "$${SITETITLE}" ] ; then \
		/usr/local/bin/wp option update blogname "untitled" --path="${INDEXDIR}" ; \
	fi
	@if [ -n "$${ADMINNAME}" ] && [ "$${BLOG_PRIVATE}" = "1" ] ; then \
		/usr/local/bin/wp option update blog_public 0 --path="${INDEXDIR}" ; \
	fi
	/usr/local/bin/wp rewrite structure '/%postname%/' --path="${INDEXDIR}" ; \
	/usr/local/bin/wp config shuffle-salts --path="${INDEXDIR}" ; \

.include "sakura.port.mk"
