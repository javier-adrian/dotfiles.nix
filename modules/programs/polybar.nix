{ pkgs, lib, config, ... }:

{
    services.polybar = {
        enable = true;
        script = ''polybar main &'';
        settings = {
            "bar/main" = {
                modules-center = ''date'';
            };
            "module/date" = {
                type = ''internal/date'';
                interval = 1;
                date = ''%B %d %Y'';
                time = ''%l:%M:%S'';
                label = ''%time% | %date%'';
            }; 
        };
    };
}
