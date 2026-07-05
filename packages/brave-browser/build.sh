#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the Brave source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

npm install
npm run init
npm run build Release
install -dm755 "../$PKGDIR$PREFIX/lib/brave-browser" "../$PKGDIR$PREFIX/bin"
cp -a src/out/Release/* "../$PKGDIR$PREFIX/lib/brave-browser/"
ln -sf ../lib/brave-browser/brave "../$PKGDIR$PREFIX/bin/brave-browser" || true
