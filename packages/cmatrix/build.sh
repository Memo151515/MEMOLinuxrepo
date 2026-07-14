#!/bin/bash
set -e

# 1. Arşivi geçici dizine çıkartıyoruz
tar -xf "$SRC_TARBALL" -C "$BUILDDIR" --strip-components=1
cd "$BUILDDIR"

# 2. CMake ile uyumluluk parametresini ekleyerek yapılandırıp derliyoruz
cmake -S . -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="/usr/local" \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5

cmake --build build

# 3. Dosyaları paketleme (hazırlık) dizinine kuruyoruz
DESTDIR="$PKGDIR" cmake --install build
