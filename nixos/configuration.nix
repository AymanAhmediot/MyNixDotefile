{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "YourOwnHostname"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "YourTime Zone";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


   i18n.inputMethod = {
     type = "fcitx5";
     enable = true;
     fcitx5.addons = with pkgs; [
       fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
       libsForQt5.fcitx5-qt
       fcitx5-chinese-addons  # table input method support
       fcitx5-nord            # a color theme
       fcitx5-m17n
     ];
   };

  # Configure keymap in X11
  services.xserver.xkb = {
# Add your keybourd layour 
    layout = "us,ara";
    options = "grp:alt_shift_toggle"; 
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.YourUserName = {
    isNormalUser = true;
    description = "YourUserName";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" "libvirtd" "storage" ];
    packages = with pkgs; [
    feh
    picom
    xterm
    
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    
    cabextract
    dunst
    corefonts
    gnome-disk-utility
    zip
    rar
    tree

    xorg.libX11
    xorg.libXinerama
    xorg.libXft
    xorg.libXrender
    fontconfig
    freetype
    vim 
    wget
    neovim
    git
    gh
    curl
    fastfetch 
    unzip
    unrar 
    alacritty
    btop
    bat
    rofi
    xorg.xrandr
    xorg.xinit
    xclip
    ly
    tmux
    brave
    eog
    evince
    flatpak
    zsh  
    zsh-z
    zsh-autocomplete
    zsh-autosuggestions
    zsh-syntax-highlighting
    mate.mate-polkit
    pavucontrol
    brightnessctl
    flameshot
    vlc
    floorp
    fzf
    telegram-desktop
    discord
    signal-desktop
    onlyoffice-desktopeditors
    vscode
    lightdm-gtk-greeter
    planify
    protonvpn-gui
    lf

    libsForQt5.qt5ct 
    libsForQt5.qtstyleplugin-kvantum
    lxappearance
    libsForQt5.fcitx5-qt
 
    fcitx5
    fcitx5-mozc
    fcitx5-rime
    fcitx5-configtool
    fcitx5-gtk

    awscli2
    python313Packages.pip
    python312Packages.pip
    nodejs_24
    yaru-theme
    google-cursor
    appimage-run

    gcc           # The GNU C Compiler
    gnumake       # GNU Make
    binutils      # Assembler, linker, and more
    gdb           # GNU Debugger
    cmake         # Build system generator
    meson         # Modern build system
    pkg-config    # Helps with compile/link flags for libraries
    ninja         # Fast build tool
    valgrind      # Memory debugging and profiling
    cppcheck      # Static analysis
    clang
    llvmPackages_latest.clang
    llvmPackages_latest.compiler-rt
    python312
    python313
    go

    virt-manager
    qemu
    libvirt
    dnsmasq
    virt-viewer
    spice-gtk

    nemo
    nemo-fileroller      # optional
    nemo-preview         # optional  
    networkmanagerapplet

    stacer
    xournalpp
    jmtpfs
    simple-mtpfs
    gvfs
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    dust
    mako
    xdg-desktop-portal-gtk 

 ];

environment.variables = {
  QT_STYLE_OVERRIDE = "kvantum";
  QT_QPA_PLATFORMTHEME = "qt5ct";
  XCURSOR_THEME = "GoogleDot-Black";
  XCURSOR_SIZE = "24"; 
  ZSH_Z_PATH = "${pkgs.zsh-z}/share/zsh-z/zsh-z.plugin.zsh";
  ZSH_AUTOCOMPLETE_PATH = "${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh";
  ZSH_AUTOSUGGESTIONS_PATH = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh";
  ZSH_SYNTAX_HIGHLIGHTING_PATH = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
};

 fonts.packages = with pkgs; [
 noto-fonts 
 dejavu_fonts
 font-awesome
 nerd-fonts.jetbrains-mono
 nerd-fonts.symbols-only
 corefonts
 ];


  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = false;
#  services.xserver.displayManager.ly.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
  src = /home/YourUserName/.config/dwm;
};
  

  services.xserver.desktopManager.xterm.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.enable = true;
 

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

xdg.portal = {
  enable = true;

  # For example, to use the GTK implementation:
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

};

hardware.pulseaudio.enable = false;

services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;  # use JACK audio (e.g., for music production)
};


  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["YourUserName"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

# Add and enabled mate polkit
  security.polkit.enable = true;
  systemd.user.services.polkit-mate-authentication-agent-1 = {
    description = "MATE Polkit Agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
      Type = "simple";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs.dconf.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.zsh.enableSyntaxHighlighting = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05"; 

}
