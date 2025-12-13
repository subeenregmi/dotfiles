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

      src = pkgs.fetchFromGitHub {
        owner = "NomicFoundation";
        repo = "hardhat-vscode";
        tag = "v0.8.25";
        hash = "sha256-DJm/qv5WMfjwLs8XBL2EfL11f5LR9MHfTT5eR2Ir37U=";
      };

      npmDepsHash = "sha256-bLP5kVpfRIvHPCutUvTz5MFal6g5fimzXGNdQEhB+Lw=";
      npmWorkspace = "server";

      postPatch = ''
      # Remove test workspaces that try to run npm install during build
      rm -rf test

      # Patch bundle.js to not require analytics secrets
      substituteInPlace server/scripts/bundle.js \
        --replace-fail 'if (!value || value === "")' 'if (false)'
    '';

     postInstall = ''
      # Remove dangling symlinks created by npm workspaces
      find -L $out -type l -print -delete
    '';

      buildInputs = [ pkgs.libsecret ];

      nativeBuildInputs = [ pkgs.pkg-config ];
    };
  };
}
