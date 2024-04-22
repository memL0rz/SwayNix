{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz"; 
in
{
  imports =
    [
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # --- GRUB --- #

  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "nodev";
  #boot.loader.grub.useOSProber = true;
  # --- SYSTEMD-BOOT --- #

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "NixOS";

  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  # services.wpaSupplicant.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  time.timeZone = "Europe/Berlin";

  services.xserver.xkb.layout = "us";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.libinput.enable = true;

  programs.fish.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 8000];

  };

  hardware.opengl.enable = true;
  
  users.users.fabian = {
    initialPassword = "1234";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [

    ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];
 
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    firefox
    vim
    git
    curl
    wget
  ];
  
  # Virt & Docker #
  
  virtualisation.docker.enable  = true;


  services.openssh.enable = true;
  system.stateVersion = "23.11";

}
