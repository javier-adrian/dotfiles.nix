{ config, pkgs, ... }:

{
    xsession.windowManager.i3 = {
        enable = true;
        extraConfig = ''
            set $mod Mod4
            set $ws1 "1:"
            set $ws2 "2:"
            set $ws3 "3:"
            set $ws4 "4"
            set $ws5 "5"
            set $ws6 "6"
            set $ws7 "7"
            set $ws8 "8"
            set $ws9 "9"
            set $ws10 "10"
        '';
        config = {
            modifier = ''$mod'';
            menu = ''exec rofi -show run'';
            window = {
                titlebar = false;
                border = 1;
                hideEdgeBorders = ''both'';
            };
            floating = {
                modifier = ''$mod'';
            };
            keybindings = {
                "$mod+t" = ''exec kitty'';
                "$mod+i" = ''exec firefox'';
                "$mod+p" = ''exec poweroff'';
                "$mod+d" = ''exec rofi -show run'';

                "XF86AudioRaiseVolume" = ''exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +2%'';
                "XF86AudioLowerVolume" = ''exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -2%'';
                "XF86AudioMute" = ''exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle'';

                "$mod+q" = ''kill'';
                "$mod+Shift+c" = ''reload'';
                "$mod+Shift+r" = ''restart'';
                "$mod+Shift+e" = ''exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"'';

                "$mod+f" = ''fullscreen'';
                "$mod+r" = ''mode "resize"'';

                "$mod+h" = ''split h'';
                "$mod+v" = ''split v'';

                "$mod+s" = ''layout stacking'';
                "$mod+w" = ''layout tabbed'';
                "$mod+e" = ''layout toggle split'';

                "$mod+Shift+space" = ''floating toggle'';
                "$mod+space" = ''focus mode_toggle'';

                "$mod+a" = ''focus parent'';

                "$mod+j" = ''focus left'';
                "$mod+k" = ''focus down'';
                "$mod+l" = ''focus up'';
                "$mod+semicolon" = ''focus right'';

                "$mod+Left" = ''focus left'';
                "$mod+Down" = ''focus down'';
                "$mod+Up" = ''focus up'';
                "$mod+Right" = ''focus right'';

                "$mod+Shift+j" = ''move left'';
                "$mod+Shift+k" = ''move down'';
                "$mod+Shift+l" = ''move up'';
                "$mod+Shift+semicolon" = ''move right'';

                "$mod+Shift+Left" = ''move left'';
                "$mod+Shift+Down" = ''move down'';
                "$mod+Shift+Up" = ''move up'';
                "$mod+Shift+Right" = ''move right'';

                "$mod+1" = ''workspace number $ws1'';
                "$mod+2" = ''workspace number $ws2'';
                "$mod+3" = ''workspace number $ws3'';
                "$mod+4" = ''workspace number $ws4'';
                "$mod+5" = ''workspace number $ws5'';
                "$mod+6" = ''workspace number $ws6'';
                "$mod+7" = ''workspace number $ws7'';
                "$mod+8" = ''workspace number $ws8'';
                "$mod+9" = ''workspace number $ws9'';
                "$mod+0" = ''workspace number $ws10'';

                "$mod+Shift+1" = ''move container to workspace number $ws1'';
                "$mod+Shift+2" = ''move container to workspace number $ws2'';
                "$mod+Shift+3" = ''move container to workspace number $ws3'';
                "$mod+Shift+4" = ''move container to workspace number $ws4'';
                "$mod+Shift+5" = ''move container to workspace number $ws5'';
                "$mod+Shift+6" = ''move container to workspace number $ws6'';
                "$mod+Shift+7" = ''move container to workspace number $ws7'';
                "$mod+Shift+8" = ''move container to workspace number $ws8'';
                "$mod+Shift+9" = ''move container to workspace number $ws9'';
                "$mod+Shift+0" = ''move container to workspace number $ws10'';
            };
            modes = {
                resize = {
                    "j" = ''resize shrink width 10px or 10ppt'';
                    "k" = ''resize grow height 10px or 10ppt'';
                    "l" = ''resize shrink height 10px or 10ppt'';
                    "semicolon" = ''resize grow width 10px or 10ppt'';

                    "Left" = ''resize shrink width 10px or 10ppt'';
                    "Up" = ''resize grow height 10px or 10ppt'';
                    "Down" = ''resize shrink height 10px or 10ppt'';
                    "Right" = ''resize grow width 10px or 10ppt'';

                    "Return" = ''mode "default"'';
                    "Escape" = ''mode "default"'';
                    "$mod+r" = ''mode "default"'';
                };
            };
            startup = [
                {
                    command = ''exec --no-startup-id xset s off'';
                    always = false;
                    notification = false;
                }
                {
                    command = ''exec --no-startup-id xset -dpms s off'';
                    always = false;
                    notification = false;
                }
            ];
            bars = [];
        };
    };
}
