{
  description = "solhint package flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.buildNpmPackage {
        name = "solhint";
        pname = "solhint";

        src = pkgs.fetchFromGitHub {
          owner = "protofire";
          repo = "solhint";
          tag = "v6.0.1";
          hash = "sha256-pK/dt3kzR32ftkVECSv2sPOJlg+16mSuH+Kf0ORyoCo=";
        };

        npmDepsHash = "sha256-j0Wkfkw/HwSRjWu7b8C6+TKAkTj50w5Pq4efhP9VVHw=";

        dontNpmBuild = true;
      };
  };
}
