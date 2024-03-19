{ config, pkgs, ... }:

{
    programs.nixvim.options = {
        number = true;
        termguicolors = true;
        signcolumn = "yes";
        colorcolumn = "100";
        showmode = false;
        scrolloff = 8;
        cursorline = false;
        showtabline = 0;

        shiftwidth = 4;
        autoindent = true;
        smartindent = true;
        breakindent = false;
        expandtab = true;
        tabstop = 4;

        hlsearch = false;
        ignorecase = true;
        smartcase = true;

        mouse = "a";
        clipboard = "unnamedplus";
        undofile = true;

        updatetime = 250;
        timeoutlen = 300;

        completeopt = "menuone,noselect";
    };
}
