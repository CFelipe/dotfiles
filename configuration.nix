{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
    ];

  environment.pathsToLink = [ "/libexec" ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "bender";
  networking.networkmanager.enable = true;

  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    #   consoleFont = "Lat2-Terminus16";
    #   consoleKeyMap = "us";
  };

  time.timeZone = "America/Sao_Paulo";

  environment.systemPackages = with pkgs; [
    alacritty
    arandr
    autojump
    beets
    clojure
    cmus
    docker
    emacs
    feh
    firefox
    git
    kodi
    pciutils
    xorg.xf86videointel
    rofi
    scrot
    vim
    wget
    xclip
    zathura
  ];

  fileSystems."/data" = {
    device = "/dev/disk/by-label/DATA";
    options = [ "uid=1001" "gid=100" "dmask=007" "fmask=117"];
  };

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.videoDrivers = [ "intel" "nvidia" ];

  hardware.bumblebee.enable = true;
  hardware.bumblebee.connectDisplay = true;
  hardware.bumblebee.driver = "nvidia";

  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

    config = ''
Section "Device"
    Identifier "intelgpu0"
    Driver "intel"
    Option "VirtualHeads" "2"
EndSection
    '';

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
  };

  virtualisation.docker.enable = true;

  programs.autojump.enable = true;
  programs.zsh.enable = true;

  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "vi-mode" "autojump" ];
    theme = "robbyrussell";
  };

  users.users.felipecortez = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  home-manager.users.felipecortez = {
    programs.git = {
      enable = true;
      userName  = "FelipeCortez";
      userEmail = "felipecortezfi@gmail.com";
    };
  };

  system.stateVersion = "19.09";

}
