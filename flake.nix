{
  description = "Rust development shell (pinned nixpkgs)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # change if needed
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.cargo
          pkgs.rustc
        ];
      };
    };
}
