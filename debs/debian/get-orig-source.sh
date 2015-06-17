#!/bin/bash

set -ex

PKG="${1}"
VERSION="${2}"
ZIPFILE="${PKG}-${VERSION}.zip"
ORIG_TARBALL="../${PKG}_${VERSION}.orig.tar.xz"

[ ! -f "${ORIG_TARBALL}" ] || exit 0

rm -rf "${PKG}"*
rm -rf "${PKG}-${VERSION}"
rm -f "${ZIPFILE}"

wget -c -t 1 -T 5 "https://github.com/ReactiveX/RxJava/archive/v${VERSION}.zip" -O "${ZIPFILE}" || exit 1

unzip "${ZIPFILE}" || exit 1

rm -f "${ZIPFILE}"

mv "RxJava"* "${PKG}-${VERSION}"

rm -rf "${PKG}-${VERSION}"/*gradle*
rm -f "${PKG}-${VERSION}"/.travis.yml
rm -rf "${PKG}-${VERSION}"/src/perf
rm -rf "${PKG}-${VERSION}"/src/test
rm -f "${PKG}-${VERSION}"/.git*

tar -cJf "${ORIG_TARBALL}" --exclude-vcs "${PKG}-${VERSION}" || exit 1

rm -rf "${PKG}-${VERSION}"
rm -f "${ZIPFILE}"

