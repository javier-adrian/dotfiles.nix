{ config, pkgs, ... }:

{
    imports = [
        ./indent-blankline.nix
        ./lualine.nix
        ./comment.nix
        ./which-key.nix
        ./gitsigns.nix
    ];
}
