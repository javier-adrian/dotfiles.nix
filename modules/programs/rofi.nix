{ config, pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        theme = 
        let
            inherit (config.lib.formats.rasi) mkLiteral;
        in {
            "*" = {
                background-color = mkLiteral ''#000000'';
                foreground-color = mkLiteral ''#ffffff'';
                text-color = mkLiteral ''#ffffff'';
                font = mkLiteral ''"FiraCode Nerd Font 8"'';
            };
            "window" = {
                anchor = mkLiteral ''north'';
                location = mkLiteral ''north'';
                height = mkLiteral ''5%'';
                width = mkLiteral ''100%'';
                padding = mkLiteral ''10px'';
                children = map mkLiteral [ ''horibox'' ];
            };
            "horibox" = {
                orientation = mkLiteral ''horizontal'';
                children = map mkLiteral [ ''entry'' ''listview'' ];
            };
            "listview" = {
                layout = mkLiteral ''horizontal'';
                spacing = mkLiteral ''5px'';
                lines = 100;
            };
            "entry" = {
                expand = false;
                width = mkLiteral ''10em'';
            };
            "element" = {
                text-color = mkLiteral ''#808080'';
            };
            "element selected" = {
                text-color = mkLiteral ''#ffffff'';
            };
        };
    };
}
