{
  description = "solidity-ls flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  
  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    stdenv = pkgs.stdenv;
  in {
    packages.${system}.default = stdenv.mkDerivation {
      name = "solidity-ls";

      src = pkgs.fetchFromGitHub {
        owner = "qiuxiang";
        repo = "solidity-ls";
        tag = "v0.5.4";
        hash = "sha256-pK/dt3kzR32ftkVECSv2sPOJlg+16mSuH+Kf0ORyoCo=";
      };
    };
  };
}
