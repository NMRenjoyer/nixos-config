{ userSettings, systemSettings, ... }: 
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # set monitor preferences
      monitor = if systemSettings.hostname == "nixos-desktop"
        then "HDMI-1,1920x1080@144,0x0,1"
        else [
	  "eDP-1,preferred,auto,1"
	  "HDMI-A-1,preferred,auto,1,mirror,eDP-1"
	];
      # set variables and programs
      "$mod" = "SUPER";
      "$terminal" = "${userSettings.terminal}";
      "$fileManager" = "${userSettings.fileManager}";
      "$browser" = "${userSettings.browser}";
      "$menu" = "rofi -show drun -show-icons";
	
	### startup ###

      exec-once = [
        "waybar &"
        "nm-applet --indicator &"
      ];

        ### appearance ###
	
	general = {
	  
	};


	### hotkeys ###
      bind = [

	
	  "$mod, RETURN, exec, $terminal"
	  "$mod, C, killactive"
	  "$mod, code:1, exit"
	  "$mod, L, exec, $fileManager"
	  "$mod, F, exec, $browser"
	  "$mod, R, exec, $menu"
	  ", Print, exec, grimblast copy area"
	  
	### workspaces ###

	# move focus within workspace
	  "$mod, left, movefocus, l"
	  "$mod, right, movefocus, r"
	  "$mod, up, movefocus, u"
	  "$mod, down, movefocus, d"
	
	# change workspace orientation
	  "$mod, P, pseudo"
	  "$mod, J, togglesplit"

	# Zero-in Workspace
	  "$mod, KP_Insert, togglespecialworkspace, magic"
	  "$mod SHIFT, KP_Insert, movetoworkspace, special:magic"
	# Scroll through workspaces
#	  "$mod mouse_down, workspace, e+1"
#	  "$mod mouse_up, workspace, e-1"
        ] ++ (
	# Map workspaces to numpad keycodes
	let
	  numpadCodes = [ "KP_End" "KP_Down" "KP_Next" "KP_Left" "KP_Begin" "KP_Right" "KP_Home" "KP_Up" "KP_Prior" ];
	  keybindings = builtins.concatMap (
	    i:
	      let
	        ws = builtins.toString (i + 1);
		code = builtins.toString (builtins.elemAt numpadCodes i);
	      in [
                "$mod, ${code}, workspace, ${ws}"
                "$mod SHIFT, ${code}, movetoworkspace, ${ws}"
              ]
	  ) (builtins.genList(i: i) (builtins.length numpadCodes));
	in
	  keybindings
	);
      workspace = [
        "1,persistent:true"
        "2,persistent:true"
        "3,persistent:true"
        "4,persistent:true"
        "5,persistent:true"
      ];
    };


    # click and drag windows around workspace (change soon)
#    bindm = [
#      "$mod, mouse:272, movewindow"
#      "$mod, mouse:273, resizewindow"
#    ];
    extraConfig = "";
  };
} 
