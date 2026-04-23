{
  description = "Lab environment setup";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";

  outputs =
    inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      # Helper function to generate outputs for each system
      forEachSupportedSystem =
        f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import inputs.nixpkgs {
              inherit system;
              config = {
                allowUnfree = true;
              };
            };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              talosctl
              kubectl
              fluxcd
              jq
              yq
              yamllint
              yamlfmt
            ];

            shellHook = ''
              echo "Homelab shell"
              echo "Kubectl: $(kubectl version --client | head -1)"
              echo "fluxcd: $(flux version --client )"

            '';
          };
        }
      );

    };
}
