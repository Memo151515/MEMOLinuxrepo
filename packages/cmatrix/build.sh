#!/bin/bash
set -e

# 1. Arşivi geçici dizine çıkartıyoruz
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

# 2. CMake ile yapılandırıp derliyoruz
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/local"
cmake --build build

# 3. Dosyaları paketleme (hazırlık) dizinine kuruyoruz
DESTDIR="$PKGDIR" cmake --install build
