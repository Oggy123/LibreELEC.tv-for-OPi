# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-bnes"
PKG_VERSION="1838408"
PKG_SHA256="da7704ae7da88bfdff6e131aa80886eeb800efba5e9f49bb6fa0e242fdce0526"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/bnes-libretro"
PKG_URL="https://github.com/libretro/bnes-libretro/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="bnes-libretro-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.bnes: bNES for Kodi"
PKG_LONGDESC="game.libretro.bnes: bNES for Kodi"

PKG_LIBNAME="bnes_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="BNES_LIB"

make_target() {
  make
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
