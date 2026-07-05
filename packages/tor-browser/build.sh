#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the Tor Browser source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

if [ -x ./mach ]; then
  ./mach build
  DESTDIR="$(cd ../"$PKGDIR" && pwd)" ./mach install
else
  echo "Tor Browser needs a pinned Tor Project build recipe before production use." >&2
  exit 1
fi
