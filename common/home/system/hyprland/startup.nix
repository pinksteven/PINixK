{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- syncthing --no-browser"
      "sleep 2; uwsm app -- vesktop --start-minimized"
      "uwsm app -- steam -silent"
    ];
  };
}
