{
  programs.nixvim.plugins.inc-rename = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    {
      action = ":IncRename ";
      key = "gR";
    }
  ];
}
