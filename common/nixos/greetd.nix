{
  stylix.targets.regreet.enable = true;
  programs.regreet.enable = true;

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
