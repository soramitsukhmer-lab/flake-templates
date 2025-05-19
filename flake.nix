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
        "node-shell" = {
          path = ./node-shell;
          description = "A Node.js development environment";
        };
        "node16-shell" = {
          path = ./node16-shell;
          description = "A Node.js 16 development environment";
        };
      };
      templates.default = self.templates.shell;
    };
}
