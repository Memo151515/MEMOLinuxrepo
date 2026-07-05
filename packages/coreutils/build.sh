#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the coreutils source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"

tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

FORCE_UNSAFE_CONFIGURE=1 ./configure \
  --prefix="$PREFIX" \
  --enable-no-install-program=kill,uptime

make
make DESTDIR="$(cd ../"$PKGDIR" && pwd)" install
