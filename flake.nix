{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."YutonoMacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
         ./configuration.nix
        home-manager.darwinModules.home-manager
       ];
    };
  };
}
