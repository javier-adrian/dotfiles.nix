{ config, pkgs, ... }:

{
    programs.nixvim.keymaps = [

        {
            action = '':w<CR>'';
            key = ''<C-s>'';
            mode = [ "n" ];
        }

        {
            action = '':m .-2<CR>=='';
            key = ''<A-Up>'';
            mode = [ "n" ];
        }

        {
            action = '':m .+1<CR>=='';
            key = ''<A-Down>'';
            mode = [ "n" ];
        }

        {
            action = '':wincmd h<CR>'';
            key = ''<C-h>'';
            mode = [ "n" ];
        }

        {
            action = '':wincmd j<CR>'';
            key = ''<C-j>'';
            mode = [ "n" ];
        }

        {
            action = '':wincmd k<CR>'';
            key = ''<C-k>'';
            mode = [ "n" ];
        }

        {
            action = '':wincmd l<CR>'';
            key = ''<C-l>'';
            mode = [ "n" ];
        }

        {
            action = '':tabprevious<CR>'';
            key = ''<A-j>'';
            mode = [ "n" ];
        }

        {
            action = '':tabnext<CR>'';
            key = ''<A-k>'';
            mode = [ "n" ];
        }

        {
            action = '':tabedit '';
            key = ''<A-t>'';
            mode = [ "n" ];
        }

    ];
}
