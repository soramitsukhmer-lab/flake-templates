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
        "node18-shell" = {
          path = ./node18-shell;
          description = "A Node.js 18 development environment with Yarn";
        };
        "node20-shell" = {
          path = ./node20-shell;
          description = "A Node.js 20 development environment with Yarn";
        };
        "node22-shell" = {
          path = ./node22-shell;
          description = "A Node.js 22 development environment with Yarn";
        };
      };
      defaultTemplate = self.templates.shell;
    };
}
