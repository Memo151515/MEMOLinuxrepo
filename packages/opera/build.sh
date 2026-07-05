#!/usr/bin/env sh
set -eu

: "${SRC_TARBALL:?set SRC_TARBALL to the reviewed Opera vendor archive}"
BUILDDIR="${BUILDDIR:-build}"
PKGDIR="${PKGDIR:-pkg}"
PREFIX="${PREFIX:-/usr}"

rm -rf "$BUILDDIR" "$PKGDIR"
mkdir -p "$BUILDDIR" "$PKGDIR"
case "$SRC_TARBALL" in
  *.deb) ar x "$SRC_TARBALL" --output "$BUILDDIR" && tar -xf "$BUILDDIR"/data.tar.* -C "$PKGDIR" ;;
  *.rpm) bsdtar -xf "$SRC_TARBALL" -C "$PKGDIR" ;;
  *.tar.*|*.tgz) tar -xf "$SRC_TARBALL" -C "$PKGDIR" ;;
  *) echo "Unsupported Opera payload format: $SRC_TARBALL" >&2; exit 1 ;;
esac
mkdir -p "$PKGDIR$PREFIX/bin"
[ -e "$PKGDIR/usr/lib/x86_64-linux-gnu/opera/opera" ] && ln -sf /usr/lib/x86_64-linux-gnu/opera/opera "$PKGDIR$PREFIX/bin/opera" || true
