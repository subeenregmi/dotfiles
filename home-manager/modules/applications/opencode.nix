let 
  unstable = import <nixpkgs-unstable> {};
in
{
  programs.opencode = {
    enable = true;

    package = unstable.opencode;
  };
}
