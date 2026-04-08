{ lib , stdenv , cmake }: 
let
  fs = lib.fileset;
in
stdenv.mkDerivation {
  pname = "basicapp";
  version = "1.0";

  src = fs.toSource rec {
    root = ./tablecruncher;
    fileset = fs.unions [
        ./tablecruncher/CMakeLists.txt
        (fs.fileFilter (file: file.hasExt "cpp" || file.hasExt "hxx") "${root}/src")
    ];
  };

  nativeBuildInputs = [
    cmake
  ];
}
