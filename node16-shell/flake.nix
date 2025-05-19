{
  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
    }:
    let
      forEachSystem =
        f:
        nixpkgs.lib.genAttrs (import systems) (
          system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              overlays = [
                (self: super: {
                  yarn = super.yarn.override {
                    nodejs = super.nodejs-16_x;
                  };
                })
              ];
            };
          }
        );
    in
    {
      devShells = forEachSystem (
        { pkgs }:
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              pkgs.nodejs-16_x
              pkgs.yarn
            ];
            shellHook = ''
              export NODE_OPTIONS="--openssl-legacy-provider"
              echo "Welcome to your Node.js development environment!"
              echo "Node.js $(node -v)"
              echo "Yarn v$(yarn -v)"
            '';
          };
        }
      );
    };
}
