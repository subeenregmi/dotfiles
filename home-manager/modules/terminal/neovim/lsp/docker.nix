
{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        docker_compose_language_service = {
          enable = true;
        };

        dockerls = {
          enable = true;
        };
      };
    };
  };
}
