{ config, pkgs, ... }:


let d = builtins.fetchGit { url = "https://github.com/FelipeCortez/dotfiles"; };
in
{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
   (self: super: {
     neovim = super.neovim.override {
       viAlias = true;
       vimAlias = true;
     };
   })
   ];

  environment.pathsToLink = [ "/libexec" ];
  environment.sessionVariables.SHELL = "zsh";
  environment.sessionVariables.TERMINAL = [ "alacritty" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "beep";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "latarcyrheb-sun32";

  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;

    monitorSection = ''
      DisplaySize 609 342
    '';

    displayManager = {
      defaultSession = "none+i3";
    };

    desktopManager = {
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

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.autojump.enable = true;
  programs.zsh.enable = true;

  users.users.felipecortez = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "audio" ];
  };

  home-manager.users.felipecortez = { pkgs, ... }: {
    programs.git = {
      enable = true;
      userName  = "FelipeCortez";
      userEmail = "felipecortezfi@gmail.com";
    };

    home.sessionVariables = {
      TERMINAL = "alacritty";
      SHELL = "zsh";
    };

    # home.file.".emacs.d/init.el".source = "${d.outPath}/init.el";

    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "vi-mode" "autojump" ];
        theme = "robbyrussell";
      };
    };
  };

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    ag
    awscli
    arandr
    alacritty
    autojump
    clojure
    docker
    emacs
    feh
    firefox
    font-manager
    git
    imagemagick
    leiningen
    gnumake
    neovim
    nodejs
    nodePackages.typescript
    pavucontrol
    python3
    rofi
    ripgrep
    scrot
    slack
    spotify
    unzip
    vim
    wget
    xclip
    xorg.xbacklight
    zathura
    zip

    pulumi-bin
    minikube
    kubectl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
