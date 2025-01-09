{ pkgs, config, ... }:
let
  hostname = config.var.hostname;
  keyboardLayout = config.var.keyboardLayout;
in
{

  networking.hostName = hostname;

  security.polkit.enable = true;

  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ]; # Add svg support to gtk
  services = {
    xserver = {
      enable = true;
      xkb.layout = keyboardLayout;
      xkb.variant = "";
      excludePackages = [ pkgs.xterm ];
      videoDrivers = [ "amdgpu" ];
    };
    gnome.gnome-keyring.enable = true;
  };
  console.keyMap = keyboardLayout;

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  environment.variables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    EDITOR = "nvim";
  };

  services.libinput.enable = true;
  programs.dconf.enable = true;
  services = {
    dbus.enable = true;
    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;
    fwupd.extraRemotes = [ "lvfs-testing" ];
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };

  # Faster rebuilding
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  # use uwsm to manage hyprland like the wiki recommends
  programs.uwsm.enable = true;

  environment.systemPackages = with pkgs; [
    fd
    bc
    gcc
    git-ignore
    xdg-utils
    wget
    curl

    # I'm pretty sure this is an official tool to manage my laptop
    framework-tool

    # so at least with qt6ct the themes have to be system wide
    adwaita-qt
    adwaita-qt6
  ];

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
