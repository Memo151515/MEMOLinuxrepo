#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the Chromium source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

gn gen out/Release --args="is_debug=false is_component_build=false use_sysroot=false is_official_build=true"
ninja -C out/Release chrome chrome_sandbox

install -dm755 "../$PKGDIR$PREFIX/lib/chromium" "../$PKGDIR$PREFIX/bin"
cp -a out/Release/chrome out/Release/chrome_sandbox "../$PKGDIR$PREFIX/lib/chromium/"
ln -sf ../lib/chromium/chrome "../$PKGDIR$PREFIX/bin/chromium"
