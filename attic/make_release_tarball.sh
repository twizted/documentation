#!/bin/sh

PROJECT=eduvpn
RELEASE=0.9.2

VUP_OWNER=eduVPN
VUP_REPO=vpn-user-portal
VUP_VERSION=5.0.0
VUP_COMMIT=6bdfed5830d0f009e657fc3a3825cb2c41f10dda

VAP_OWNER=eduVPN
VAP_REPO=vpn-admin-portal
VAP_VERSION=3.0.0
VAP_COMMIT=e83ed504c4ffa78dd6537b471e0acd801cd8aa2b

VCA_OWNER=eduVPN
VCA_REPO=vpn-config-api
VCA_VERSION=4.0.1
VCA_COMMIT=706789874a5c39fe71b5e2a593a667442dd09f37

VSA_OWNER=eduVPN
VSA_REPO=vpn-server-api
VSA_VERSION=2.0.0
VSA_COMMIT=a660d171122ee8a95d3701f5c473dcffef5704a5

D_OWNER=eduVPN
D_REPO=documentation
D_VERSION=${RELEASE}
D_COMMIT=master

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
