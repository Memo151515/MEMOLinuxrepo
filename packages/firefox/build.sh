#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the Firefox source archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

cat > mozconfig <<EOF
ac_add_options --prefix=$PREFIX
ac_add_options --enable-release
ac_add_options --enable-application=browser
ac_add_options --disable-debug
ac_add_options --with-system-zlib
EOF

./mach build
DESTDIR="$(cd ../"$PKGDIR" && pwd)" ./mach install
