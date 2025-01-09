{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "sleep 2; uwsm app -- vesktop --start-minimized"
      "uwsm app -- easyeffects --gapplication-service"
      "uwsm app -- syncthing --no-browser"
      "uwsm app -- steam -silent"
    ];
  };
}
