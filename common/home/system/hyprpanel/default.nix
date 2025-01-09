# Hyprpanel is the bar on top of the screen
# Display information like workspaces, battery, wifi, ...
{ pkgs, config, ... }:
let
  transparentButtons = config.var.theme.bar.transparentButtons;

  base00 = "#${config.lib.stylix.colors.base00}";
  base01 = "#${config.lib.stylix.colors.base01}";
  base02 = "#${config.lib.stylix.colors.base02}";
  base03 = "#${config.lib.stylix.colors.base03}";
  base04 = "#${config.lib.stylix.colors.base04}";
  base05 = "#${config.lib.stylix.colors.base05}";
  base06 = "#${config.lib.stylix.colors.base06}";
  base07 = "#${config.lib.stylix.colors.base07}";
  base08 = "#${config.lib.stylix.colors.base08}";
  base09 = "#${config.lib.stylix.colors.base09}";
  base0A = "#${config.lib.stylix.colors.base0A}";
  base0B = "#${config.lib.stylix.colors.base0B}";
  base0C = "#${config.lib.stylix.colors.base0C}";
  base0D = "#${config.lib.stylix.colors.base0D}";
  base0E = "#${config.lib.stylix.colors.base0E}";
  base0F = "#${config.lib.stylix.colors.base0F}";

  font = config.var.theme.desktopFont;
  fontSize = "${toString config.stylix.fonts.sizes.desktop}";

  rounding = config.var.theme.rounding;
  border-size = config.var.theme.border-size;

  gaps-out = config.var.theme.gaps-out;
  gaps-in = config.var.theme.gaps-in;

  floating = config.var.theme.bar.floating;
  transparent = config.var.theme.bar.transparent;
  position = config.var.theme.bar.position;

  location = config.var.location;
  username = config.var.username;

  yazi = ''${pkgs.kitty}/bin/kitty --class=yazi zsh -c 'yazi'';
in
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "uwsm app -- ${pkgs.hyprpanel}/bin/hyprpanel"
  ];

  home.packages = with pkgs; [
    hyprpanel
    libnotify
  ];

  home.file.".config/hyprpanel/config.json".text = # json
    ''
      {
        "bar.layouts": {
          "*": {
            "left": [
              "dashboard",
              "workspaces",
              "windowtitle"
            ],
            "middle": [
              "media"
            ],
            "right": [
              "systray",
              "network",
              "bluetooth",
              "volume",
              "battery",
              "clock",
              "notifications"
            ]
          }
        },
        "theme.font.name": "${font}",
        "theme.font.size": "${fontSize}px",
        "theme.bar.outer_spacing": "${if floating && transparent then "0" else "8"}px",
        "theme.bar.buttons.y_margins": "${if floating && transparent then "0" else "4"}px",
        "theme.bar.buttons.spacing": "0.3em",
        "theme.bar.buttons.radius": "${
          if transparent then toString rounding else toString (rounding - 8)
        }px",
        "theme.bar.floating": ${if floating then "true" else "false"},
        "theme.bar.buttons.padding_x": "0.8rem",
        "theme.bar.buttons.padding_y": "0.4rem",

        "theme.bar.buttons.workspaces.hover": "${base02}",
        "theme.bar.buttons.workspaces.active": "${base0D}",
        "theme.bar.buttons.workspaces.available": "${base0C}",
        "theme.bar.buttons.workspaces.occupied": "${base08}",

        "theme.bar.margin_top": "${if position == "top" then toString (gaps-in * 2) else "0"}px",
        "theme.bar.margin_bottom": "${if position == "top" then "0" else toString (gaps-in * 2)}px",
        "theme.bar.margin_sides": "${toString gaps-out}px",
        "theme.bar.border_radius": "${toString rounding}px",

        "bar.launcher.icon": "",
        "theme.bar.transparent": ${if transparent then "true" else "false"},
        "bar.workspaces.show_numbered": false,
        "bar.workspaces.workspaces": 5,
        "bar.workspaces.monitorSpecific": true,
        "bar.workspaces.hideUnoccupied": true,
        "bar.workspaces.ignored": "spotify",
        "bar.windowtitle.label": true,
        "bar.volume.label": false,
        "bar.network.truncation_size": 12,
        "bar.bluetooth.label": false,
        "bar.clock.format": "%a %d %b  %H:%M",
        "bar.notifications.show_total": true,
        "theme.notification.border_radius": "${toString rounding}px",
        "theme.osd.enable": true,
        "theme.osd.orientation": "vertical",
        "theme.osd.location": "right",
        "theme.osd.radius": "${toString rounding}px",
        "theme.osd.margins": "0px 0px 0px 10px",
        "theme.osd.muted_zero": false,
        "menus.clock.weather.location": "${location}",
        "menus.clock.weather.key": "myapikey",
        "menus.clock.weather.unit": "metric",
        "menus.clock.time.military": true,
        "menus.dashboard.powermenu.avatar.image": "/home/${username}/.profile_picture.png",
        "menus.dashboard.powermenu.confirmation": true,

        "menus.dashboard.shortcuts.left.shortcut1.icon": "󰈹",
        "menus.dashboard.shortcuts.left.shortcut1.command": "firefox",
        "menus.dashboard.shortcuts.left.shortcut1.tooltip": "Firefox",
        "menus.dashboard.shortcuts.left.shortcut2.icon": "",
        "menus.dashboard.shortcuts.left.shortcut2.command": "spotify",
        "menus.dashboard.shortcuts.left.shortcut2.tooltip": "Spotify",
        "menus.dashboard.shortcuts.left.shortcut3.icon": "󰅶",
        "menus.dashboard.shortcuts.left.shortcut3.command": "caffeine",
        "menus.dashboard.shortcuts.left.shortcut3.tooltip": "Caffeine",
        "menus.dashboard.shortcuts.left.shortcut4.icon": "",
        "menus.dashboard.shortcuts.left.shortcut4.command": "menu",
        "menus.dashboard.shortcuts.left.shortcut4.tooltip": "Search Apps",
        "menus.dashboard.shortcuts.right.shortcut1.icon": "󰖔",
        "menus.dashboard.shortcuts.right.shortcut1.command": "night-shift",
        "menus.dashboard.shortcuts.right.shortcut1.tooltip": "Night-shift",
        "menus.dashboard.shortcuts.right.shortcut3.icon": "󰄀",
        "menus.dashboard.shortcuts.right.shortcut3.command": "screenshot region swappy",
        "menus.dashboard.shortcuts.right.shortcut3.tooltip": "Screenshot",

        "menus.dashboard.directories.left.directory1.label": "󰉍 Downloads",
        "menus.dashboard.directories.left.directory1.command": "${yazi} $HOME/Downloads/; exit'",
        "menus.dashboard.directories.left.directory2.label": "󰉏 Pictures",
        "menus.dashboard.directories.left.directory2.command": "${yazi} $HOME/Pictures/; exit'",
        "menus.dashboard.directories.left.directory3.label": "󱧶 Documents",
        "menus.dashboard.directories.left.directory3.command": "${yazi} $HOME/Documents/; exit'",
        "menus.dashboard.directories.right.directory1.label": "󱂵 Home",
        "menus.dashboard.directories.right.directory1.command": "${yazi} $HOME/; exit'",
        "menus.dashboard.directories.right.directory2.label": "󰚝 Projects",
        "menus.dashboard.directories.right.directory2.command": "${yazi} $HOME/dev/; exit'",
        "menus.dashboard.directories.right.directory3.label": " Config",
        "menus.dashboard.directories.right.directory3.command": "${yazi} $HOME/.config/; exit'",

        "theme.bar.menus.monochrome": true,
        "wallpaper.enable": false,
        "theme.bar.menus.background": "${base00}",
        "theme.bar.menus.cards": "${base01}",
        "theme.bar.menus.card_radius": "${toString rounding}px",
        "theme.bar.menus.label": "${base0D}",
        "theme.bar.menus.text": "${base05}",
        "theme.bar.menus.border.size": "${toString border-size}px",
        "theme.bar.menus.border.color": "${base01}",
        "theme.bar.menus.border.radius": "${toString rounding}px",
        "theme.bar.menus.popover.text": "${base0D}",
        "theme.bar.menus.popover.background": "${base01}",
        "theme.bar.menus.listitems.active": "${base0D}",
        "theme.bar.menus.icons.active": "${base0D}",
        "theme.bar.menus.switch.enabled":"${base0D}",
        "theme.bar.menus.check_radio_button.active": "${base0D}",
        "theme.bar.menus.buttons.default": "${base0D}",
        "theme.bar.menus.buttons.active": "${base0D}",
        "theme.bar.menus.iconbuttons.active": "${base0D}",
        "theme.bar.menus.progressbar.foreground": "${base0D}",
        "theme.bar.menus.slider.primary": "${base0D}",
        "theme.bar.menus.tooltip.background": "${base00}",
        "theme.bar.menus.tooltip.text": "${base05}",
        "theme.bar.menus.dropdownmenu.background":"${base00}",
        "theme.bar.menus.dropdownmenu.text": "${base05}",
        "theme.bar.background": "${base00 + (if transparentButtons then "00" else "")}",
        "theme.bar.buttons.style": "default",
        "theme.bar.buttons.monochrome": true,
        "theme.bar.buttons.text": "${base0D}",
        "theme.bar.buttons.background": "${
          (if transparent then base00 else base01) + (if transparentButtons then "00" else "")
        }",
        "theme.bar.buttons.icon": "${base0D}",
        "theme.bar.buttons.notifications.background": "${base01}",
        "theme.bar.buttons.hover": "${base02}",
        "theme.bar.buttons.notifications.hover": "${base02}",
        "theme.bar.buttons.notifications.total": "${base0D}",
        "theme.bar.buttons.notifications.icon": "${base0D}",
        "theme.notification.background": "${base01}",
        "theme.notification.actions.background": "${base0D}",
        "theme.notification.actions.text": "${base01}",
        "theme.notification.label": "${base0D}",
        "theme.notification.border": "${base01}",
        "theme.notification.text": "${base05}",
        "theme.notification.labelicon": "${base0D}",
        "theme.osd.bar_color": "${base0D}",
        "theme.osd.bar_overflow_color": "${base08}",
        "theme.osd.icon": "${base00}",
        "theme.osd.icon_container": "${base0D}",
        "theme.osd.label": "${base0D}",
        "theme.osd.bar_container": "${base00}",
        "theme.bar.menus.menu.media.background.color": "${base00}",
        "theme.bar.menus.menu.media.card.color": "${base01}",
        "theme.bar.menus.menu.media.card.tint": 90,
        "bar.customModules.updates.pollingInterval": 1440000,
        "bar.media.show_active_only": true,
        "theme.bar.location": "${position}",

        "bar.windowtitle.title_map": [
          ["yazi", "", "Yazi"]
        ]
      }
    '';
}
