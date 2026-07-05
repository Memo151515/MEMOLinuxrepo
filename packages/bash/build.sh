#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the bash source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"

tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

./configure --prefix="$PREFIX" --without-bash-malloc --with-installed-readline
make
make DESTDIR="$(cd ../"$PKGDIR" && pwd)" install
