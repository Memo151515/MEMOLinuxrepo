#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the Midori source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

meson setup memo-build --prefix="$PREFIX" --buildtype=release
meson compile -C memo-build
DESTDIR="$(cd ../"$PKGDIR" && pwd)" meson install -C memo-build
