{
  description = "circom-lsp package flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.rustPlatform.buildRustPackage rec {
        pname = "circom-lsp";
        version = "0.1.3";

        src = "${pkgs.fetchFromGitHub {
          owner = "rubydusa";
          repo = pname;
          rev = "refs/tags/v${version}";
          hash = "sha256-Y71qmeDUh6MwSlFrSnG+Nr/un5szTUo27+J/HphGr7M=";
        }}/server";

        cargoHash = "sha256-R/DgNJi2vx8opqh5THlRQA1b9FIl+fkXYruyx7f9HKc=";

        doCheck = false;
      };
  };
}
