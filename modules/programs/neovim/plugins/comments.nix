{ config, pkgs, ... }:

{
    programs.nixvim.plugins.comments-nvim = {
        enable = true;
    };
}
