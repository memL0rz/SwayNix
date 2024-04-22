{ config, pkgs, ... }:
{  
  imports = [
    ./config/nixvim.nix
    ./config/sway.nix
    #./config/player.nix
  ];

  home.username = "fabian";
  home.homeDirectory = "/home/fabian";
  
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 90;
  };
  
  nixpkgs.config.allowUnfree = true;
  home.enableNixpkgsReleaseCheck = false;
  
  home.packages = with pkgs; [
    vlc
    slurp
    grim
    ncmpcpp
    xdg-utils
    brightnessctl
    neofetch
    onefetch
    zip
    unzip
    jq
    sysstat
    ethtool
    filezilla
    qbittorrent
    pciutils
    usbutils
    eza
    python3
    rustup
    vscode
    neovide
    vim
    gcc
    discord
    firefox
    jetbrains-toolbox
    blueman
    rofi
    pavucontrol
    dolphin
    swaybg
    playerctl
    waybar
    curl
    wget
    wezterm
    qbittorrent
    git
    cava
    mpd
    mpv
    mpc-cli  
  ];

  programs.git = {
    enable = true;
    userName = "Fab1anDev";
    userEmail = "Fab1anDev.de";
  };

  programs.starship = {
    enable = true;
    
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.fish = {
    enable = true;
    shellInit = ''clear; neofetch'';

    shellAliases = {
      c = "clear";
      serve = "python -m http.server";
      ls = "exa -l --icons=always";
      ns = "nix-shell";
      rm = "rm -rfv";
      mv = "mv -v";
      rgen = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 1d";
      update = "sudo nixos-rebuild switch";
    };
  }; 

 

  home.file.".config/wezterm/wezterm.lua".source = ./config/wezterm/wezterm.lua;
  home.file.".config/rofi/config.rasi".source = ./config/rofi/config.rasi;
  home.file.".config/waybar/config".source = ./config/waybar/config;
  home.file.".config/waybar/style.css".source = ./config/waybar/style.css;	

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
