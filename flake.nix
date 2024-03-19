{
    description = "Home Manager configuration of creui";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        sf = {
            url = "github:adamcstephens/apple-fonts.nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, nixvim, sf, ... }@inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        templates = {
            default = {
                path = ./;
                description = ''Default'';
            };
        };

        defaultTemplate = self.templates.default;

        nixosConfigurations.default = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./configuration.nix
            ];
        };

        homeConfigurations."creui" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ 
                ./home.nix 
                nixvim.homeManagerModules.nixvim
            ];
        };
    };
}
