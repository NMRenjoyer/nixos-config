{ pkgs, config, ...}:

{
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''${pkgs.xdragon}/bin/dragon-drop -a -x "$fx"'';
      editor-open = ''nvim $f'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
      '';
    };

    keybindings = {

      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";  
      "g~" = "cd";
      "g/" = "/";
      e = "editor-open";
      
      ### bookmark configuration ###
      "'" = "mark-load";
      "\"" = "mark-remove";
      m = "mark-save";


      # ...
    };
      settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
  };
}
