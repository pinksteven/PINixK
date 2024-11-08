{ pkgs, config, inputs, ... }:
let
  border-size = config.var.theme.border-size;
  gaps-in = config.var.theme.gaps-in;
  gaps-out = config.var.theme.gaps-out;
  active-opacity = config.var.theme.active-opacity;
  inactive-opacity = config.var.theme.inactive-opacity;
  rounding = config.var.theme.rounding;
  blur = config.var.theme.blur;
  keyboardLayout = config.var.keyboardLayout;
in {
    imports = [ ./rules.nix ./animations.nix ./binds.nix ./plugins.nix ./polkitagent.nix ./startup.nix ];

    home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5ct
    kdePackages.qt6ct
    adwaita-qt
    adwaita-qt6
    hyprshot
    hyprpicker
    satty
    imv
    wf-recorder
    wlr-randr
    wl-clipboard
    brightnessctl
    gnome-themes-extra
    libva
    dconf
    wayland-utils
    wayland-protocols
    glib
    direnv
    meson
    papers
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    plugins = [ 
        inputs.hyprspace.packages.${pkgs.system}.Hyprspace 
        inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
    # idk why but this works, and puuting this in plugins doesn't
    extraConfig = ''
        plugin = ${inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so
    '';

    settings = {
        monitor = ", preferred, auto, 1.566667";
        xwayland = {force_zero_scaling = true;};

        env = [
            "XDG_SESSION_TYPE,wayland"
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_DESKTOP,Hyprland"
            "MOZ_ENABLE_WAYLAND,1"
            "ANKI_WAYLAND,1"
            "DISABLE_QT5_COMPAT,0"
            "NIXOS_OZONE_WL,1"
            "XDG_SESSION_TYPE,wayland"
            
            "QT_AUTO_SCREEN_SCALE_FACTOR,1"
            "QT_QPA_PLATFORM,wayland"
            "QT_QPA_PLATFORMTHEME,qt6ct"
            "QT_QUICK_CONTROLS_STYLE,org.kde.desktop"
            "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
            "ELECTRON_OZONE_PLATFORM_HINT,auto"

            "DIRENV_LOG_FORMAT,"
            "WLR_DRM_NO_ATOMIC,1"
            "WLR_BACKEND,vulkan"
            "WLR_RENDERER,vulkan"
            "SDL_VIDEODRIVER,wayland"
            "CLUTTER_BACKEND,wayland"

            # Set up folders
            "XDG_DESKTOP_DIR, $HOME/Desktop"
            "XDG_DOWNLOAD_DIR, $HOME/Downloads"
            "XDG_TEMPLATES_DIR, $HOME/Templates"
            "XDG_DOCUMENTS_DIR, $HOME/Documents"
            "XDG_MUSIC_DIR, $HOME/Music"
            "XDG_PICTURES_DIR, $HOME/Pictures"
            "XDG_VIDEOS_DIR, $HOME/Videos"
        ];

        general = {
            gaps_in = gaps-in;
            gaps_out = gaps-out;
            border_size = border-size;

            resize_on_border = true;
            extend_border_grab_area = 15;
        };

        decoration = {
            active_opacity = active-opacity;
            inactive_opacity = inactive-opacity;
            rounding = rounding;
            drop_shadow = true;
            shadow_range = 20;
            shadow_render_power = 3;
            blur = { enabled = if blur then "true" else "false"; size = 8; passes = 1;};
        };
        
        dwindle = {
            pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true; # You probably want this
        };

        master = {
            new_status = "master";
        };

        misc = {
            disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background.
            disable_splash_rendering = true;
            disable_autoreload = true;
            new_window_takes_over_fullscreen = 2;
        };

        input = {
            kb_layout = keyboardLayout;

            repeat_delay = 300;
            repeat_rate = 50;
            follow_mouse = 1;

            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

            touchpad = {
                disable_while_typing = false;
                natural_scroll = true;
                tap-to-click = true;
                tap-and-drag = true;
            };
        };
        gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 3;
            workspace_swipe_distance = 600;
            workspace_swipe_use_r = true;
        };

        cursor = {
            no_warps = true;
            inactive_timeout = 60;
            enable_hyprcursor = true;
        };
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
}
