{ pkgs, lib, config, ... }:

{
   
   services.polybar = {
       enable = true;
       package = pkgs.polybar.override {
           alsaSupport = true; 
           i3Support = true; 
       };
       script = ''polybar main &'';
       settings = {
           "colors" = {
               background = ''#00000000'';
               foreground = ''#dfdfdf'';
               foreground-alt = ''#555'';
               primary = ''#ffb52a'';
               secondary = ''#e60053'';
               alert = ''#bd2c40'';
               green = ''#00ff00'';
               orange = ''#ffa500'';
               red = ''#ff0000'';
           };
           "bar/main" = {
               modules-left = ''i3'';
               modules-center = ''date'';
               modules-right = ''xbacklight'';
               font-0 = ''SF Pro Display:size=8:weight=bold;'';
               font-1 = ''FiraCode Nerd Font:style=Bold:size=8'';
           };
           "module/date" = {
               type = ''internal/date'';
               interval = 1;
               date = ''%B %d, %Y'';
               time = ''%l:%M:%S'';
               label = ''%time% | %date%'';
           }; 
           "module/i3" = {
               type = ''internal/i3'';
               format = ''<label-state> <label-mode>'';
               index-sort = true;
               wrapping-scroll = false;

               label-mode-padding = 2;
               label-mode-foreground = ''#000'';
               label-mode-background = ''''${colors.primary}'';

               label-focused = ''%name%'';
               label-focused-background = ''''${colors.background}'';
               label-focused-padding = 2;

               label-unfocused = ''%name%'';
               label-unfocused-foreground = ''''${colors.foreground-alt}'';
               label-unfocused-padding = 2;

               label-visible = ''%index%'';
               label-visible-foreground = ''''${colors.foreground-alt}'';
               label-visible-background = ''''${self.label-focused-background}'';
               label-visible-padding = ''''${self.label-focused-padding}'';

               label-urgent = ''%index%'';
               label-urgent-foreground = ''''${colors.secondary}'';
               label-urgent-padding = 2;

               strip-wsnumbers = true;
           }; 
           "module/xbacklight" = {
               type = ''internal/xbacklight'';
               format = ''<label> <bar>'';
               label = '' '';
               bar-width = 10;
               bar-indicator = ''|'';
               bar-indicator-foreground = ''#fff'';
               bar-fill = '''';
               bar-fill-foreground = ''#fff'';
               bar-empty = '''';
               bar-empty-foreground = ''''${colors.foreground-alt}'';
           }; 
       };
   };
}
