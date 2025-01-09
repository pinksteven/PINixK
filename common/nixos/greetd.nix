{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland --config /etc/greetd/greetland.conf > /dev/null 2>&1";
        user = "greeter";
      };
    };
  };

  stylix.targets.regreet.enable = true;
  programs.regreet.enable = true;

  environment.etc."greetd/greetland.conf".text = # hyprland config for launcing regreet
    ''
      exec-once = regreet; hyprctl dispatch exit
      misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
          disable_hyprland_qtutils_check = true
      }
    '';

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
