{config, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    package = pkgs.swayfx-unwrapped;
    wrapperFeatures.gtk = true;

    extraSessionCommands = ''
      export _JAVA_AWT_WM_NONREPARENTING=1
      export QT_QPA_PLATFORM=wayland
      export XDG_CURRENT_DESKTOP=sway
    '';

    config = rec {
      modifier = "Mod4";
      terminal = "wezterm";
      menu = "${pkgs.rofi}/bin/rofi -show drun -c .config/rofi/config.rasi";
      startup = [
        {command = "swaybg -i $HOME/.wp/skull_purple.png";}
      ];
      bars = [{ command = "waybar"; }];      
      gaps = {
	outer = 5;
	inner = 10;
      };

      window = {
	border = 0;
      };
      
      keybindings = {
        # IMPORTANT STUFF #
	"${modifier}+Return" = "exec ${terminal}";
	"${modifier}+F" = "exec firefox";
	"${modifier}+space" = "exec ${menu}";
	"${modifier}+D" = "exec discord";
	"${modifier}+C" = "exec code";
	"${modifier}+Q" = "kill";
	"${modifier}+Shift+R" = "reload";
	"${modifier}+Shift+S" = "grim -g '$(slurp)'";
	# WINDOW STUFF #
	"${modifier}+Shift+space" = "floating toggle";
	"${modifier}+Shift+F" = "fullscreen toggle";
	"${modifier}+Left" = "focus left";
	"${modifier}+Down" = "focus down";
	"${modifier}+Up" = "focus up";
	"${modifier}+Right" = "focus right";

	"${modifier}+Ctrl+Right" = "resize shrink width 3 px or 3 ppt";
	"${modifier}+Ctrl+Down" = "resize grow height 3 px or 3 ppt";
	"${modifier}+Ctrl+Up" = "resize shrink height 3 px or 3 ppt";
	"${modifier}+Ctrl+Left" = "resize grow width 3 px or 3 ppt";
		
	"${modifier}+Shift+Left" = "move left";
	"${modifier}+Shift+Down" = "move down";
	"${modifier}+Shift+Up" = "move up";
	"${modifier}+Shift+Right" = "move right";

	# WORKSPACES #
	"${modifier}+1" = "workspace number 1";
	"${modifier}+2" = "workspace number 2";
     	"${modifier}+3" = "workspace number 3";
	"${modifier}+4" = "workspace number 4";
	"${modifier}+5" = "workspace number 5";
	"${modifier}+6" = "workspace number 6";
	"${modifier}+7" = "workspace number 7";
	"${modifier}+8" = "workspace number 8";
	"${modifier}+9" = "workspace number 9";

	# MOVE WINDOW TO OTHER WS #
	"${modifier}+Shift+1" = "move container to workspace number 1";
	"${modifier}+Shift+2" = "move container to workspace number 2";
	"${modifier}+Shift+3" = "move container to workspace number 3";
	"${modifier}+Shift+4" = "move container to workspace number 4";
	"${modifier}+Shift+5" = "move container to workspace number 5";
	"${modifier}+Shift+6" = "move container to workspace number 6";
	"${modifier}+Shift+7" = "move container to workspace number 7";
	"${modifier}+Shift+8" = "move container to workspace number 8";
  	"${modifier}+Shift+9" = "move container to workspace number 9";
	
	# Audio
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "exec set-volume toggle-mute";
        "XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";

        "XF86MonBrightnessDown" = "exec brightnessctl set 15%-";
        "XF86MonBrightnessUp" =  "exec brightnessctl set +15%";
		
      };
    };
    
    extraConfig = ''
	shadows enable
      	corner_radius 12
       	blur_radius 7
     	blur_passes 4
	default_dim_inactive 0.2
	
	for_window [app_id="wezterm"] blur enable
	for_window [app_id="code"] blur enable
	for_window [app_id="rofi"] blur enable

      	default_border pixel 0px
      	default_floating_border none
      	titlebar_border_thickness 0
    '';
  };
}
