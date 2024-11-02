# Vesktop is a discord client
{ config, pkgs, ... }: 
let
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


  font = "${config.stylix.fonts.serif.name}";
  fontSize = "${toString config.stylix.fonts.sizes.desktop}";
in {
    home.packages = with pkgs; [ vesktop ];
    stylix.targets.vesktop.enable = false;

    home.file.".config/vesktop/themes/nixnight.css" = {
        text = #css
        ''
        /**
         * @name nixnight
         * @description A dark, rounded discord theme, edited with stylix colors
         * @author refact0r
         * @version 1.6.2
         * @invite nz87hXyvcy
         * @website https://github.com/refact0r/midnight-discord
         * @source https://github.com/refact0r/midnight-discord/blob/master/midnight.theme.css
         * @authorId 508863359777505290
         * @authorLink https://www.refact0r.dev
        */

        /* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */

        @import url('https://refact0r.github.io/midnight-discord/midnight.css');

        /* customize things here */
        :root {
	        /* font, change to 'gg sans' for default discord font*/
	        --font: 'figtree';

	        /* top left corner text */
	        --corner-text: 'Nixnight';

	        /* color of status indicators and window controls */
            --online-indicator: ${base0B};     /* change to #23a55a for default green */
	        --dnd-indicator: ${base08};                  /* change to #f13f43 for default red */
	        --idle-indicator: ${base0A};    /* change to #f0b232 for default yellow */
	        --streaming-indicator: ${base0D};       /* change to #593695 for default purple */

	        /* accent colors */
            --accent-1: ${base0E};            /* links */
	        --accent-2: ${base0E};             /* general unread/mention elements, some icons when active */
	        --accent-3: ${base0E};             /* accent buttons */
	        --accent-4: ${base03};      /* accent buttons when hovered */
	        --accent-5: ${base07};   /* accent buttons when clicked */
	        --mention:  ${base00}1a;             /* mentions & mention messages */
	        --mention-hover: ${base00}0d; /* mentions & mention messages when hovered */

	        /* text colors */
	        --text-0: var(--bg-4);               /* text on colored elements */
	        --text-1: ${base06};            /* other normally white text */
	        --text-2: ${base06};            /* headings and important text */
	        --text-3: ${base05};    /* normal text */
	        --text-4: ${base05};    /* icon buttons and channels */
	        --text-5: ${base04};               /* muted channels/chats and timestamps */

	        /* background and dark colors */
            --bg-1: ${base0E};                             /* dark buttons when clicked */
	        --bg-2: ${base02};              /* dark buttons */
	        --bg-3: ${base01};               /* spacing, secondary elements */
	        --bg-4: ${base00};                             /* main background color */
	        --hover: ${base03}1a;                     /* channels and buttons when hovered */
	        --active: ${base03}33;                    /* channels and buttons when clicked or selected */
	        --message-hover: #0000001a;            /* messages when hovered */

	        /* amount of spacing and padding */
	        --spacing: 12px;

	        /* animations */
	        /* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
	        --list-item-transition: 0.2s ease;  /* channels/members/settings hover transition */
	        --unread-bar-transition: 0.2s ease; /* unread bar moving into view transition */
	        --moon-spin-transition: 0.4s ease;  /* moon icon spin */
	        --icon-spin-transition: 1s ease;    /* round icon button spin (settings, emoji, etc.) */

	        /* corner roundness (border-radius) */
	        --roundness-xl: 22px; /* roundness of big panel outer corners */
	        --roundness-l: 20px; /* popout panels */
	        --roundness-m: 16px; /* smaller panels, images, embeds */
	        --roundness-s: 12px; /* members, settings inputs */
	        --roundness-xs: 10px; /* channels, buttons */
	        --roundness-xxs: 8px; /* searchbar, small elements */

	        /* direct messages moon icon */
	        /* change to block to show, none to hide */
	        --discord-icon: none; /* discord icon */
	        --moon-icon: block; /* moon icon */
	        --moon-icon-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg'); /* custom icon url */
	        --moon-icon-size: auto;

	        /* filter uncolorable elements to fit theme */
	        /* (just set to none, they're too much work to configure) */
	        --login-bg-filter: saturate(0.3) hue-rotate(-15deg) brightness(0.4); /* login background artwork */
	        --green-to-accent-3-filter: hue-rotate(56deg) saturate(1.43); /* add friend page explore icon */
	        --blurple-to-accent-3-filter: hue-rotate(304deg) saturate(0.84) brightness(1.2); /* add friend page school icon */
        }

        /* Selected chat/friend text */
        .selected_f5eb4b,
        .selected_f6f816 .link_d8bfb3 {
            color: var(--text-0) !important;
            background: var(--accent-3) !important;
        }

        .selected_f6f816 .link_d8bfb3 * {
            color: var(--text-0) !important;
            fill: var(--text-0) !important;
        }
        '';
    };
}