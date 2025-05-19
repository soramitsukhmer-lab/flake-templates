{
  description = "A collection of project templates for Nix Flake";

  outputs =
    { self }:
    {
      templates = {
        shell = {
          path = ./shell/default;
          description = "Default shell template";
        };
        "nodejs-shell" = {
          path = ./shell/nodejs;
          description = "A Node.js development environment";
        };
        "nodejs16-shell" = {
          path = ./shell/nodejs16;
          description = "A Node.js 16 development environment";
        };
      };
      templates.default = self.templates.shell;
    };
}
