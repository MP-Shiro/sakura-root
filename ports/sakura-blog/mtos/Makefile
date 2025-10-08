# New ports collection makefile for:	mtos
# Date created:		2010-01-22
# Whom:			SAKURA Internet Inc. <support@sakura.ad.jp>
#
# $FreeBSD$
#

PORTNAME=	mtos
PORTVERSION=	5.2.13
CATEGORIES=	sakura-blog
DISTNAME=	MTOS-${PORTVERSION}-ja

MAINTAINER=	support@sakura.ad.jp
COMMENT=	${CGIURL}/mt.cgi
WRKSRC=		${WRKDIR}/${DISTNAME}

# sakura-ports setting
INDEXDIR=	"${PREFIX}/${CGIDIR}"
NO_BUILD=	yes
FORCE_PKG_REGISTER=	yes
PLIST_SUB+=	CGIDIR="${CGIDIR}"

# pkg-sakura configure
CGISUBDIR?=	${PORTNAME}

# application setting
SUB_FILES=	pkg-message pkg-deinstall mt-config.cgi
SUB_LIST+=	CGISUBDIR="${CGISUBDIR}" \
		CGIDIR="${CGIDIR}" \
		CGIURL="${CGIURL}" \
		INDEXDIR="${INDEXDIR}" \
		DOMAIN="${DOMAIN}" \
		DBNAME="${DBNAME}" \
		DBUSER="${DBUSER}" \
		DBPASS="${DBPASS}" \
		DBHOST="${DBHOST}"

do-stage:
	@${PKG_STAGE} ${WRKSRC} ${CGIDIR}
	@${INSTALL} -m 600 ${WRKDIR}/mt-config.cgi ${STAGEDIR}/${CGIDIR}/mt-config.cgi

.include "sakura.port.mk"
