# local modification

PKG_DBDIR=	${HOME}/db/pkg
PORTSDIR=	${HOME}/ports
LOCALBASE=	${HOME}
PREFIX=		${HOME}
PORTEPOCH=	${SAKURADUP}

OPTIONS_UNSET=	DOCS EXAMPLES
NO_DEPENDS=	yes
INSTALL_AS_USER=	yes
DISABLE_VULNERABILITIES=	yes
VALID_CATEGORIES+=	${CATEGORIES}
NOPORTDATA=	yes
REINPLACE_ARGS=	-i ''
DISABLE_LICENSES=	yes

NKF?=		/usr/local/bin/nkf
.if exists(/usr/bin/htpasswd)
HTPASSWD?=	/usr/bin/htpasswd
.elif exists(/usr/local/bin/htpasswd)
HTPASSWD?=	/usr/local/bin/htpasswd
.endif
TOUCH?=		/usr/bin/touch

# build targets

.include "${PORTSDIR}/Mk/bsd.commands.mk"

PKGDIR?=	${.CURDIR}
FILESDIR?=	${PKGDIR}/files
WRKDIR?=	${PKGDIR}/work
STAGEDIR?=	${WRKDIR}/stage
DISTDIR?=	${PKGDIR}/../../distfiles
CGIDIR?=	www
WWWDIR=		${CGIDIR%%/*}

PORTREVISION?=	0
.if ${PORTREVISION} != 0
_SUF1=	_${PORTREVISION}
.endif
PKGVERSION=	${PORTVERSION:C/[-_,]/./g}${_SUF1}

PKGNAME=	${PORTNAME}-${PKGVERSION}
DISTNAME?=	${PKGNAME}
DISTSRC?=	${DISTNAME}
EXTRACT_SUFX?=	.tar.gz
DISTFILE?=	${DISTNAME}${EXTRACT_SUFX}
WRKSRC?=	${WRKDIR}/${DISTNAME}
MAKE_ARGS?=
COMMENT?=	${CGIURL}/

SUB_LIST+=	PREFIX="${PREFIX}"
_SUB_LIST_TEMP=	${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/}

PKG_INFO?=	/usr/local/libexec/qinst/info
PKG_EXTRACT?=	/usr/local/libexec/qinst/extract
PKG_PATCH?=	/usr/local/libexec/qinst/patch
PKG_BUILD?=	/usr/local/libexec/qinst/build
PKG_STAGE?=	/usr/local/libexec/qinst/stage
PKG_INSTALL?=	/usr/local/libexec/qinst/install
PKG_REGISTER?=	/usr/local/libexec/qinst/register

DONE_EXTRACT=	${WRKDIR}/.extract_done
DONE_PATCH=	${WRKDIR}/.patch_done
DONE_BUILD=	${WRKDIR}/.build_done
DONE_STAGE=	${WRKDIR}/.stage_done
DONE_INSTALL=	${WRKDIR}/.install_done
DONE_REGISTER=	${WRKDIR}/.register_done

clean:
	@${ECHO_MSG} "===>  Cleaning for ${PKGNAME}"
	@${RM} -r ${WRKDIR}

${DONE_EXTRACT}: extract

extract:
	@${ECHO_MSG} "===>  Extracting for ${PKGNAME}"
	@${PKG_EXTRACT} ${DISTFILE}
	@${TOUCH} ${DONE_EXTRACT}

# patch

${DONE_PATCH}: patch

patch: ${DONE_EXTRACT}
	@${ECHO_MSG} "===>  Patching for ${PKGNAME}"
	@${PKG_PATCH} ${WRKSRC}
.if defined(SUB_FILES)
.for file in ${SUB_FILES}
.if !exists(${FILESDIR}/${file}.in)
	@${ECHO_MSG} "** Missing ${FILESDIR}/${file}.in for ${PKGNAME}."; exit 1
.else
	@${SED} ${_SUB_LIST_TEMP} -e '/^@comment /d' ${FILESDIR}/${file}.in > ${WRKDIR}/${file}
.endif
.endfor
.endif
	@${TOUCH} ${DONE_PATCH}

# build

build: ${DONE_PATCH} do-build post-build

${DONE_BUILD}: build

.if !target(do-build)
do-build:
.if !defined(NO_BUILD)
	@${ECHO_MSG} "===>  Building for ${PKGNAME}"
	@${PKG_BUILD} ${WRKSRC} ${MAKE_ARGS}
.endif
.endif

.if !target(post-build)
post-build:
	@${TOUCH} ${DONE_BUILD}
.endif

# staging

stage: ${DONE_BUILD} do-stage post-stage

${DONE_STAGE}: stage

.if !target(do-stage)
do-stage:
	@${ECHO_MSG} "===>  Staging for ${PKGNAME}"
	@${PKG_STAGE} ${WRKSRC} ${CGIDIR}
.endif

.if !target(post-stage)
post-stage:
	@${TOUCH} ${DONE_STAGE}
.endif

# install

install: ${DONE_STAGE} pre-install do-install post-install

${DONE_INSTALL}: install

.if !target(pre-install)
pre-install:
.endif

.if !target(do-install)
do-install:
	@${ECHO_MSG} "===>  Installing for ${PKGNAME}"
	@${PKG_INSTALL} ${PKGNAME} ${CGIDIR} ${HOME}
.endif

.if !target(post-install)
post-install:
	@${TOUCH} ${DONE_INSTALL}
.endif

# register

register: ${DONE_INSTALL} do-register post-register

.if !target(do-register)
do-register:
	@${ECHO_MSG} "===>  Registering for ${PKGNAME}"
	@${PKG_REGISTER} ${PKGNAME} ${COMMENT}

.endif

.if !target(post-register)
post-register:
	@${TOUCH} ${DONE_REGISTER}
.endif

all: stage

.MAIN: all
