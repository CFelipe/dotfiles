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
    arandr
    deadbeef
    emacs
    firefox
    git
    scrot
    rofi
    vim
    wget
    xclip
  ];

  fileSystems."/data" = {
    device = "/dev/disk/by-label/DATA";
    options = [ "uid=1001" "gid=100" "dmask=007" "fmask=117"];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

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

 users.users.felipecortez = {
   isNormalUser = true;
   extraGroups = [ "wheel" ];
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
