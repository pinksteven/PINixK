{
  #
  # env = [
  #   "XDG_SESSION_TYPE,wayland"
  #   "XDG_CURRENT_DESKTOP,Hyprland"
  #   "XDG_SESSION_DESKTOP,Hyprland"
  #   "MOZ_ENABLE_WAYLAND,1"
  #   "ANKI_WAYLAND,1"
  #   "DISABLE_QT5_COMPAT,0"
  #   "NIXOS_OZONE_WL,1"
  #   "XDG_SESSION_TYPE,wayland"
  #
  #   "QT_AUTO_SCREEN_SCALE_FACTOR,1"
  #   "QT_QPA_PLATFORM,wayland"
  #   "QT_QPA_PLATFORMTHEME,qt6ct"
  #   "QT_QUICK_CONTROLS_STYLE,org.kde.desktop"
  #   "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
  #   "ELECTRON_OZONE_PLATFORM_HINT,auto"
  #
  #   "DIRENV_LOG_FORMAT,"
  #   "WLR_DRM_NO_ATOMIC,1"
  #   "WLR_BACKEND,vulkan"
  #   "WLR_RENDERER,vulkan"
  #   "SDL_VIDEODRIVER,wayland"
  #   "CLUTTER_BACKEND,wayland"
  # ];

  home.file.".config/uwsm/env".text = # shell (# export KEY=VALUE)
    ''
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=Hyprland
      export XDG_SESSION_DESKTOP=Hyprland
      export MOZ_ENABLE_WAYLAND=1
      export ANKI_WAYLAND=1
      export DISABLE_QT5_COMPAT=0
      export NIXOS_OZONE_WL=1
      export XDG_SESSION_TYPE=wayland

      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_QPA_PLATFORM=wayland
      export QT_QPA_PLATFORMTHEME=qt6ct
      export QT_QUICK_CONTROLS_STYLE=org.kde.desktop
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export ELECTRON_OZONE_PLATFORM_HINT=auto

      export WLR_DRM_NO_ATOMIC=1
      export WLR_BACKEND=vulkan
      export WLR_RENDERER=vulkan
      export SDL_VIDEODRIVER=wayland
      export CLUTTER_BACKEND=wayland
    '';
}
