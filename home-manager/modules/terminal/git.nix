{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Subeen Regmi";
    userEmail = "subeenregmi123@gmail.com";
  };
}
