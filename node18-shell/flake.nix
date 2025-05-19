{
  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
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
                    nodejs = super.nodejs_18;
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
          default = pkgs.mkShell {
            packages = with pkgs; [
              pkgs.nodejs_18
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
