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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "tool";
    pname = "akeyless-csi-provider";
    vendorHash = "sha256-8if5uRCc9HCP3EMth7TjtLM81Exjp9yLBGlVndIp+2A=";
    description = "Akeyless provider for the Kubernetes Secrets Store CSI Driver";
    homepage = "https://github.com/pleme-io/akeyless-csi-provider";
  };
}
