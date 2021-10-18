# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
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

  # Nixpkgs Config

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
                                      };
                                 };
                   };

  # Set your time zone.

  time.timeZone = "Australia/Sydney";

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

  # Normal Users Config
  users.users.gk = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
  };

  # Software List

  environment.systemPackages = with pkgs; [
    wget
    yafetch
    neofetch
    pfetch
    alacritty
    rofi
    polybar
    discord
    steam
    flameshot
    picom
    teams
    libreoffice
    gimp
    kdenlive
    feh
    lxappearance
    pavucontrol
    desktop-file-utils
    firefox
  ];

  # Set Sys Version

  system.stateVersion = "21.05";

  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
  ];
}
