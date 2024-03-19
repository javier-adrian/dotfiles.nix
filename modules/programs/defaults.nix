{ config, pkgs, ... }:

{
    imports = [
        ./zsh/zsh.nix
        ./neovim/defaults.nix
        ./rofi.nix
        ./i3.nix
        ./polybar.nix
        ./git.nix
    ];
}
