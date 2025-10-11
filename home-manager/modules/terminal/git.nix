{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Subeen Regmi";
    userEmail = "subeenregmi123@gmail.com";
    extraConfig = {
      url = {
        "ssh://git@github.com/sparklayer-io" = {
            insteadOf = "https://github.com/sparklayer-io";
        };
      };
    };
  };
}
