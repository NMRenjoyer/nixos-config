{ ... }: 
{
  programs.git = {
    enable = true;
    settings = {
      user = {
	name = "NMRenjoyer";
        email = "dcreetz+github@proton.me";
      };
    };
  };
}
