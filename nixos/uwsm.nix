{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "${lib.getExe inputs.hyprland.packages."${pkgs.system}".hyprland}";
      };
    };
  };
}
