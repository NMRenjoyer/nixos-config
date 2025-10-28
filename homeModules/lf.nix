{ ... }:
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
      fzf-jump = ''
        ''${{
        res="$(find . | fzf --reverse --header="Jump to location")"
        if [ -n "$res" ]; then
          if [ -d "$res" ]; then
            cmd="cd"
        else
            cmd="select"
        fi
        res="$(printf '%s' "$res" | sed 's/\\/\\\\/g;s/"/\\"/g')"
        lf -remote "send $id $cmd \"$res\""
    fi
}}
      '';
    };
    keybindings = {
      o = "dragon-out";
      a = "mkdir";
      f = "$$EDITOR $(fzf)";
      ### navigation ###
      "\\'" = "mark-load";
      "\\\"" = "mark-remove";
      m = "mark-save";
      "<c-f>" = "fzf-jump";
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
