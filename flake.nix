{
  description = "rust-service — consumer of the fomiller platform flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    platform = {
      url = "git+file:///Users/forrest/dev/personal/nix-platform-poc/platform?ref=v0.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, platform }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        repoConfig = import ./repo.nix;
        repo = platform.lib.mkRepository pkgs repoConfig;
      in
      {
        apps.generate = repo.generateApp;
        apps.default = repo.generateApp;
      }
    );
}
