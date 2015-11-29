{ boost, cmake, fetchurl, leechcraft-core, qt4, stdenv }:

stdenv.mkDerivation rec {
  name = "leechcraft-advancednotifications";
  version = "0.6.70";

  src = fetchurl {
    url = "https://dist.leechcraft.org/LeechCraft/0.6.70/leechcraft-0.6.70.tar.xz";
    sha1 = "a7c64e05855725dfb8d19de8ee24d11183ee0ef5";
  };

  buildInputs = [ boost cmake leechcraft-core qt4 ];

  coreCmakeModulePath = "${leechcraft-core.out}/share/leechcraft/cmake";
  
  dontUseCmakeBuildDir = true;
  smth = leechcraft-core.out;
  preConfigure = ''
    cmakeDir="$PWD/src/plugins/advancednotifications"
    cmakeFlags="-DCMAKE_MODULE_PATH=${coreCmakeModulePath};$PWD/src $cmakeFlags"
    mkdir build
    cd build
  '';

  meta = with stdenv.lib; {
    description = "Advanced notifications plugin for LeechCraft";
    homepage = https://leechcraft.org/;
    maintainers = [ maintainers.fornever ];
    platforms = platforms.unix;
    license = licenses.boost;
  };
}
