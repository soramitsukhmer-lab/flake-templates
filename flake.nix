{
  description = "A collection of project templates for Nix Flake";

  outputs =
    { self }:
    {
      templates = {
        shell = {
          path = ./shell;
          description = "Default shell template";
        };
        "node16-shell" = {
          path = ./node16-shell;
          description = "A Node.js 16 development environment with Yarn";
        };
      };
      defaultTemplate = self.templates.shell;
    };
}
