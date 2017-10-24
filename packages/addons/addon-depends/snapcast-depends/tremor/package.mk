################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################
GIT_HASH="b56ffce0c0773ec5ca04c466bc00b1bbcaf65aef"

PKG_NAME="tremor"
PKG_VERSION="b56ffce"
PKG_ARCH="any"
PKG_LICENSE="LGPL"	# ????
PKG_SITE="https://git.xiph.org/?p=tremor.git;a=summary"
PKG_URL="https://git.xiph.org/?p=tremor.git;a=snapshot;h=$GIT_HASH;sf=tgz"
PKG_SOURCE_NAME="$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-$GIT_HASH"
PKG_DEPENDS_TARGET="toolchain libogg"
PKG_SECTION="lib"
PKG_SHORTDESC="Embedded/fixed-point vorbis decoder"
PKG_LONGDESC="Embedded/fixed-point vorbis decoder"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared \
                           --with-ogg=$SYSROOT_PREFIX/usr \
                           --disable-oggtest "

