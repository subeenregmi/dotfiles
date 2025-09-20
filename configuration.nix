# SUBEEN REGMI CONFIGURATION.NIX
# subeenregmi.com @ 2025

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # Networking
  networking.hostName = "subeen-nix"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Time, date and languages
  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Display
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.hyprland.enable = true;

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  
  # Keyboard
  console.keyMap = "uk";

  # Printing
  services.printing.enable = true;

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Users
  users.users.subeen = {
    isNormalUser = true;
    description = "subeen";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
   
  # Programs

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
    kdePackages.dolphin
    networkmanagerapplet
  ];

  programs.vim.enable = true;
  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;


  # Services

  # Services - Battery
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  # Services - CPU
  services.throttled.enable = true;

  fonts.packages = with pkgs; [ ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
