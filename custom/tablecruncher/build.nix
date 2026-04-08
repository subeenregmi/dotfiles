{ 
  stdenv, 
  fltk_1_4, 
  cmake, 
  fetchFromGitHub, 
  libX11, 
  libXft, 
  libXrender, 
  fontconfig,
  zlib,
  cairo,
}:
stdenv.mkDerivation {
  pname = "basicapp";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Tablecruncher";
    repo = "tablecruncher";
    rev = "c6fec63dce318a685a6361c0a5bbd0cf798a2be5";
    sha256 = "sha256-1nqXkw0tyfk7+52K6D7Mj5sNbHuxeTU/WrKZ0y+tuvY=";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [ fltk_1_4 libX11 libXft libXrender fontconfig zlib cairo ];

  postPatch = ''
    sed -i 's|''${FLTKLIBDIR}/lib/libfltk\.a|-lfltk|g' CMakeLists.txt
    sed -i 's|''${FLTKLIBDIR}/lib/libfltk_images\.a|-lfltk_images|g' CMakeLists.txt
    sed -i '/libfltk_z/d' CMakeLists.txt
  '';

  cmakeFlags = [
    "-DFLTKINCDIR=${fltk_1_4}/include"
    "-DFLTKLIBDIR=${fltk_1_4}"
  ];

  NIX_CFLAGS_COMPILE = "-I${cairo.dev}/include/cairo";

  installPhase = ''
    mkdir -p $out/bin
    cp dist/Tablecruncher $out/bin/tablecruncher
  '';
}
