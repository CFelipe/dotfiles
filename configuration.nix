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

  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "bender";
  networking.networkmanager.enable = true;

  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    #   consoleFont = "Lat2-Terminus16";
    #   consoleKeyMap = "us";
  };

  time.timeZone = "America/Sao_Paulo";

  environment.systemPackages = with pkgs; [
    ag
    alacritty
    autojump
    beets
    calibre
    clojure
    cmus
    cmusfm
    docker
    docker-compose
    emacs
    feh
    firefox
    font-manager
    git
    kodi
    leiningen
    pandoc
    pavucontrol
    pciutils
    python3
    qt5.qtbase
    rofi
    scrot
    soulseekqt
    unzip
    vim
    wget
    xclip
    xorg.xbacklight
    xorg.xf86videointel
    zathura
    zip
  ];

  fileSystems."/data" = {
    device = "/dev/disk/by-label/DATA";
    fsType = "ntfs";
    options = [ "rw" "uid=1001" "gid=100"];
  };

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.xserver.videoDrivers = [ "intel" ];

  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

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
    extraGroups = [ "wheel" "docker" "audio" ];
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
