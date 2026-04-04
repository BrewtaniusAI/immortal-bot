{
  description = "Immortal Bot — Repro Pack (Nix flake)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: import nixpkgs { inherit system; };
    in {
      # `nix develop` — interactive shell with all dependencies
      devShells = forAllSystems (system:
        let pkgs = pkgsFor system; in {
          default = pkgs.mkShell {
            name = "immortal-bot-repro";
            packages = [ pkgs.bash pkgs.jq ];
            shellHook = ''
              echo "Immortal Bot Repro Pack shell ready."
              echo "Run: bash ./run_repro.sh"
            '';
          };
        }
      );

      # `nix run` — execute the repro directly
      apps = forAllSystems (system:
        let pkgs = pkgsFor system; in {
          default = {
            type = "app";
            program = toString (pkgs.writeShellScript "run-repro" ''
              export PATH="${pkgs.lib.makeBinPath [ pkgs.bash pkgs.jq ]}:$PATH"
              cd ${self}
              exec bash repro-pack/run_repro.sh
            '');
          };
        }
      );
    };
}
