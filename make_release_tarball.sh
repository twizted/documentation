#!/bin/sh

PROJECT=eduvpn
RELEASE=0.9.0

VUP_OWNER=eduVPN
VUP_REPO=vpn-user-portal
VUP_VERSION=4.0.0
VUP_COMMIT=a999b8b481c3e4e7da2171b66035e33b2e45e511

VAP_OWNER=eduVPN
VAP_REPO=vpn-admin-portal
VAP_VERSION=2.1.0
VAP_COMMIT=87f1d38b93b38e8bf1910c13395c5e6056e6b423

VCA_OWNER=eduVPN
VCA_REPO=vpn-config-api
VCA_VERSION=3.0.4
VCA_COMMIT=cb71ebaed1ebb19312ff1be109d900fda8d13d84

VSA_OWNER=eduVPN
VSA_REPO=vpn-server-api
VSA_VERSION=1.1.0
VSA_COMMIT=c2c34787dcb8c9a197c6c8cb9318b38bc3ce58a4

D_OWNER=eduVPN
D_REPO=documentation
D_VERSION=${RELEASE}
D_COMMIT=47fd3e72995d065f64179ff1c6b76587cf82b4d0

rm -rf ${PROJECT}-${RELEASE}
mkdir -p ${PROJECT}-${RELEASE}
rm -rf ${PROJECT}-${RELEASE}/*

(
cd ${PROJECT}-${RELEASE}
sh ../build.sh ${VUP_OWNER} ${VUP_REPO} ${VUP_VERSION} ${VUP_COMMIT}
sh ../build.sh ${VAP_OWNER} ${VAP_REPO} ${VAP_VERSION} ${VAP_COMMIT}
sh ../build.sh ${VCA_OWNER} ${VCA_REPO} ${VCA_VERSION} ${VCA_COMMIT}
sh ../build.sh ${VSA_OWNER} ${VSA_REPO} ${VSA_VERSION} ${VSA_COMMIT}
sh ../build.sh ${D_OWNER} ${D_REPO} ${D_VERSION} ${D_COMMIT}
)

tar -cJf ${PROJECT}-${RELEASE}.tar.xz ${PROJECT}-${RELEASE}

# sign the release
gpg --sign -b -a ${PROJECT}-${RELEASE}.tar.xz

echo 'DONE'
