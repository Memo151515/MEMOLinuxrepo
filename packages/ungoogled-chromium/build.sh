#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the ungoogled-chromium source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

python3 utils/prune_binaries.py . || true
python3 utils/patches.py apply . || true
gn gen out/Release --args="is_debug=false is_component_build=false use_sysroot=false"
ninja -C out/Release chrome
install -dm755 "../$PKGDIR$PREFIX/lib/ungoogled-chromium" "../$PKGDIR$PREFIX/bin"
cp -a out/Release/chrome "../$PKGDIR$PREFIX/lib/ungoogled-chromium/"
ln -sf ../lib/ungoogled-chromium/chrome "../$PKGDIR$PREFIX/bin/ungoogled-chromium"
