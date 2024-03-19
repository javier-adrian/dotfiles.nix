{ config, pkgs, ... }:

{
    programs.nixvim.plugins.comment-nvim = {
        enable = true;
    };
}
