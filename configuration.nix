# SUBEEN REGMI CONFIGURATION.NIX
# subeenregmi.com @ 2025

{ config, pkgs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "subeen-ser8"; # Define your hostname.
  networking.networkmanager.enable = true;

  # sparklayer
  networking.extraHosts = 
  ''
    127.0.0.1 app.local.sparklayer.io
    127.0.0.1 local.sparklayer.io
    127.0.0.1 redis-cache7
    127.0.0.1 spark-main-db-instance
    127.0.0.1 core-db
    127.0.0.1 spark-integration-wix
    127.0.0.1 wordpress.local.sparklayer.io
    127.0.0.1 magento.local.sparklayer.io
  '';
   

  # Docker
  virtualisation.docker.enable = true;

  services.resolved = {
    enable = true;
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true; # Open ports in the firewall for Syncthing
    user = "subeen";
    dataDir = "/home/subeen";
    configDir = "/home/subeen/.config/syncthing";
    folders = {
      "subeenfiles" = {
        id = "ietfk-xac4y";
        path = "/home/subeen/subeenfiles";
      };
    };
  };
  
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

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

  services.xserver.displayManager.gdm.enable = false;
    
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "doom";
    };
  };

  services.xserver.desktopManager.gnome.enable = false;

  programs.hyprland.enable = true;

  services.xserver.xkb = {
    layout = "us";
  };


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
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "docker"
    ];
    packages = with pkgs; [ ];
  };

  # Programs

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    networkmanagerapplet
    hyprpolkitagent
    pavucontrol
    libgphoto2
    gphoto2
    gphoto2fs
    digikam
    lsof
    hyprlock
    hypridle
    hyprpaper
    zip
    unzip
    feh
    sysstat
    grim
    slurp  
    wl-clipboard
    jq
    lshw
    inotify-tools
    libappindicator-gtk3
    playerctl
    wget
    waybar
  ];

  programs.vim.enable = true;
  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.gphoto2.enable = true;

  programs.hyprlock.enable = true;

  programs.tmux = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  # Bluetooth
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      # Shows battery charge of connected devices on supported
      # Bluetooth adapters. Defaults to 'false'.
      Experimental = true;
      # When enabled other devices can connect faster to us, however
      # the tradeoff is increased power consumption. Defaults to
      # 'false'.
      FastConnectable = true;
    };
    Policy = {
      # Enable all controllers when they are found. This includes
      # adapters present on start as well as adapters that are plugged
      # in later on. Defaults to 'true'.
      AutoEnable = true;
    };
  };
};

  services.blueman.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Services

  # Services - Battery

  services.hypridle.enable = true;

  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
