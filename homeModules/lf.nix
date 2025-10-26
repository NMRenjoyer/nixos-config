{ pkgs, ... }:
{
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''$ dragon-drop -a -x $fx'';
      
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
        }}
      '';
    };
    keybindings = {
      o = "dragon-out";
      
      ### bookmarks ###
      "\\'" = "mark-load";
      "\\\"" = "mark-remove";
      m = "mark-save";

    # ...
    };
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      ignorecase = true;
    };
  };
}
