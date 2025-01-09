{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${
          lib.getExe inputs.hyprland.packages."${pkgs.system}".hyprland
        } --config /etc/greetd/greetland.conf > /dev/null 2>&1";
      };
    };
  };

  stylix.targets.regreet.enable = true;
  programs.regreet.enable = true;

  environment.etc."greetd/greetland.conf".text = # hyprland config for launcing regreet
    ''
      exec-once = ${lib.getExe config.programs.regreet.package}; hyprctl dispatch exit
      misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
          disable_hyprland_qtutils_check = true
      }
      env = GTK_USE_PORTAL,0
      env = GDK_DEBUG,no-portals
      bind = SUPER, t, exec, kitty
    '';

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
