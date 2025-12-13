{
  description = "solidity-ls flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  
  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.buildNpmPackage {
      name = "solidity-ls";
      pname = "solidity-ls";
      version = "1.0.0";

      src = pkgs.fetchFromGitHub {
        owner = "subeenregmi";
        repo = "solidity-ls";
        tag = "v1.0.1";
        hash = "sha256-V9P+fyNpm8yID1yvQaotEjPNE3m6YK6NgHMbT0ig+Fo=";
      };

      npmDepsHash = "sha256-ucjvQVa9oVLP4VDD0/Ribrhk5xHVllOEdAjy8BnFf0Y=";

    };
  };
}
