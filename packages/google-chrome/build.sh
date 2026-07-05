#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the reviewed Google Chrome vendor archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"

case "$SRC_TARBALL" in
  *.deb) ar x "$SRC_TARBALL" --output "$BUILDDIR" && tar -xf "$BUILDDIR"/data.tar.* -C "$PKGDIR" ;;
  *.tar.*|*.tgz) tar -xf "$SRC_TARBALL" -C "$PKGDIR" ;;
  *) echo "Unsupported Chrome payload format: $SRC_TARBALL" >&2; exit 1 ;;
esac

mkdir -p "$PKGDIR$PREFIX/bin"
[ -e "$PKGDIR/opt/google/chrome/google-chrome" ] && ln -sf /opt/google/chrome/google-chrome "$PKGDIR$PREFIX/bin/google-chrome" || true
