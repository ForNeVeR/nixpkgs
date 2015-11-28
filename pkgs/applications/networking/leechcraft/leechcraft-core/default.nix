{ boost, cmake, fetchurl, libX11, openssl, pcre, qt4, stdenv }:

stdenv.mkDerivation rec {
  name = "leechcraft-core";
  version = "0.6.70";

  src = fetchurl {
    url = "https://dist.leechcraft.org/LeechCraft/0.6.70/leechcraft-0.6.70.tar.xz";
    sha1 = "a7c64e05855725dfb8d19de8ee24d11183ee0ef5";
  };

  buildInputs = [ cmake boost libX11 openssl pcre qt4 ];

  dontUseCmakeBuildDir = true;  
  preConfigure = ''
    cmakeDir="$PWD/src"
    mkdir build
    cd build
  '';
  
  cmakeFlags = "-DWITH_PLUGINS=False -DWITH_QWT=False";
  
  meta = with stdenv.lib; {
    description = "A core of cross-platform modular Internet client";
    homepage = https://leechcraft.org/;
    maintainers = [ maintainers.fornever ];
    platforms = platforms.unix;
    license = licenses.boost;
  };
}

