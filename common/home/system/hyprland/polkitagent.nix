{ inputs, pkgs, ... }:
{
  home.packages = [ pkgs.lxqt.lxqt-policykit ];

  wayland.windowManager.hyprland.settings.exec-once = [ "uwsm app -- lxqt-policykit-agent" ];
}

