{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };


  outputs = { self, nixpkgs }: 
    let
      pkgs = import nixpkgs {};
    in {
      packages.x86_64-linux.hello = pkgs.callPackage ./tablecruncher/build.nix {};
      packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    };
}
