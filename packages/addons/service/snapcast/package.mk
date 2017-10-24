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

: <<'end_long_comment'
===============================================================================

- externals are git submodules, not visible in tar.gz so need to hardcode
- some are explicitly linked into (bad carma) asio, popl, aixlog so need to be unpacked in externals
- assumes these are present as libs (HAS_TREMOR, HAS_OGG)
- build for Libreelec needs these statically linked (I guess?) or installed together

===============================================================================
end_long_comment

PKG_NAME="snapcast"
PKG_VERSION="0.12.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/badaix/snapcast"
PKG_URL="$PKG_SITE/archive/v$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION-Source"
PKG_DEPENDS_TARGET="toolchain tremor flac libvorbis libogg"
PKG_SECTION="service.multimedia"
PKG_SHORTDESC="Snapcast: Synchronous audio player."
PKG_LONGDESC="Snapcast is a multi-room client-server audio player, where all clients are time synchronized with the server to play perfectly synced audio. It's not a standalone player, but an extension that turns your existing audio player into a Sonos-like multi-room solution."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Synchronous audio player.(Snapcast)"
PKG_ADDON_TYPE="xbmc.service"

make_target() {
  env TARGET=LIBREELEC make 
}

# Should get the tags from git i guess
post_patch() {
  (
    cd $BUILD/$PKG_NAME-$PKG_VERSION/externals

    printf "%${BUILD_INDENT}c ${boldgreen}Checking out aixlog${endcolor} ${boldwhite}(@f0b8892$)${endcolor}\n" ' '>&$SILENT_OUT
    (git clone https://github.com/badaix/aixlog.git -q; cd aixlog; git checkout f0b8892 -q)

    printf "%${BUILD_INDENT}c ${boldgreen}Checking out asio${endcolor} ${boldwhite}(@28d9b8d$)${endcolor}\n" ' '>&$SILENT_OUT
    (git clone https://github.com/chriskohlhoff/asio.git -q; cd asio; git checkout 28d9b8d -q)

    printf "%${BUILD_INDENT}c ${boldgreen}Checking out popl${endcolor} ${boldwhite}(@df5a009$)${endcolor}\n" ' '>&$SILENT_OUT
    (git clone https://github.com/badaix/popl.git -q; cd popl; git checkout df5a009 -q)

    printf "%${BUILD_INDENT}c ${boldgreen}Checking out jsonrpcpp${endcolor} ${boldwhite}(@115296b$)${endcolor}\n" ' '>&$SILENT_OUT
    (git clone https://github.com/badaix/jsonrpcpp.git -q; cd jsonrpcpp; git checkout 115296b -q)
  )
}
