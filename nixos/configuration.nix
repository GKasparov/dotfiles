# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix
    ];

  # Disable SystemD-Boot
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = false;

  # Enable GRUB bootloader

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    copyKernels = false;
    useOSProber = true;
    zfsSupport = false;
    efiSupport = true;
    version = 2;
    default = "saved";
  };

  # Set your time zone.

  time.timeZone = "Australia/Sydney";

  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  # Enable NetworkManager

  networking = {
    networkmanager.enable = true;
                };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Services Options
  services = {
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "nvidia" ];
      desktopManager.xterm.enable = false;
      displayManager = {
         lightdm.enable = true;
                       };
      windowManager.default = "i3";
      windowManager.i3.package = pkgs.i3-gaps;
      windowManager.i3.enable = true;
              };
    printing.enable = true;
    ntp.enable = true;
  };

  # Enable sound.
  sound.enable = true;

  # Hardware Options

  hardware = {
    pulseaudio.enable = true;
    ckb-next.enable = true;
    opengl.enable = true;
    opengl.driSupport32Bit = true;
             };

  users.users.gk = {
    isNormalUser = true;
    extraGroups = [ "wheel" "netorwkmanager" "video" "audio" ];
                   };

  # Home Manager
  home-manager = {
    users.gk = { pkgs, ... }: {
    nixpkgs.config = {
      allowUnfree = true;
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
                                      };
                                 };
                     };
    programs.bash.enable = true;
      home.packages = [
        pkgs.neofetch
        pkgs.wget
        pkgs.yafetch
        pkgs.pfetch
        pkgs.alacritty
        pkgs.rofi
        pkgs.polybar
        pkgs.discord
        pkgs.steam
        pkgs.flameshot
        pkgs.teams
        pkgs.libreoffice
        pkgs.gimp
        pkgs.kdenlive
        pkgs.feh
        pkgs.lxappearance
        pkgs.pavucontrol
        pkgs.desktop-file-utils
        pkgs.firefox
        pkgs.ninja
        pkgs.meson
        pkgs.python
        pkgs.git
        pkgs.nix-prefetch-git
        pkgs.unzip
                      ];
                              };
                 };

  # Software List

  environment.systemPackages = with pkgs; [

  ];

  # Set Sys Version

  system.stateVersion = "21.05";

  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
  ];
}
