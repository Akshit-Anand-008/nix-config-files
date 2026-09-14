{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  security.rtkit.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  hardware.bluetooth.enable = true;
  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services = {
    displayManager.ly.enable = true;
    printing.enable = true;
    power-profiles-daemon.enable = true;
    pulseaudio.enable = false;
    upower.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "ignore";
      HandlePowerKey = "suspend";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "esc";
            leftalt = "leftcontrol";
            rightalt = "rightcontrol";
            "leftshift+leftmeta+f23" = "leftalt";
          };
        };
      };
    };
  };

  users.users."akshit" = {
    isNormalUser = true;
    description = "Akshit_Anand";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim git wget
  ];

  programs = {
    firefox.enable = true;
    niri.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      interactiveShellInit = "source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    };
  };

  system.stateVersion = "26.05";
}
