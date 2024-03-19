{ config, pkgs, ... }:

{
    programs.nixvim.plugins.gitsigns = {
        enable = true;
        currentLineBlame = true;
        currentLineBlameOpts = {
            delay = 0;
        };
        signs = {
            add = {
                text = ''▏'';
            };
        };
    };
}
