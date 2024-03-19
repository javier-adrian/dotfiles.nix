{ config, pkgs, ... }:

{
    programs.nixvim.plugins.lualine = {
        enable = true;
        sections = {
            lualine_a = [''buffers''];
            lualine_b = [];
            lualine_c = [];

            lualine_x = [''branch'' ''diff'' ''diagnostics''];
            lualine_y = [''filetype''];
            lualine_z = [''location'' ''progress''];
        };
    };
}
