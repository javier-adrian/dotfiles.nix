{ config, pkgs, ... }:

{
    programs.nixvim.plugins.indent-blankline = {
        enable = true;
        indent.char = ''▏'';
        scope = {
            enabled = true;
            showStart = true;
        };
        whitespace.removeBlanklineTrail = true;
    };
}
