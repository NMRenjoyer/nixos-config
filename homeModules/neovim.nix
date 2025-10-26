{ userSettings, ... }: 
{
  programs.${userSettings.editor} = {
    enable = true;
  };
}
