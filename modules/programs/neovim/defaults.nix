{ config, pkgs, ... }:

{
    imports = [
        ./options.nix
        ./keymaps.nix
        ./plugins/defaults.nix
    ];

    programs.nixvim = {
        enable = true;
        colorschemes.vscode.enable = true;
        extraPlugins = with pkgs.vimPlugins; [
            scrollbar-nvim
        ];
    };

    programs.neovim = {
        extraLuaConfig = ''require("scrollbar").setup{ handle = { color = "#666666" } }'';
    };
}
