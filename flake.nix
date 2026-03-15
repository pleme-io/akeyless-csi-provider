{
  description = "Akeyless provider for the Kubernetes Secrets Store CSI Driver";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoTool = (import "${substrate}/lib/go-tool.nix").mkGoTool;
    in {
      packages.default = mkGoTool pkgs {
        pname = "akeyless-csi-provider";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-8if5uRCc9HCP3EMth7TjtLM81Exjp9yLBGlVndIp+2A=";
        description = "Akeyless provider for the Kubernetes Secrets Store CSI Driver";
        homepage = "https://github.com/pleme-io/akeyless-csi-provider";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
