{ config, lib, pkgs, inputs, ... }:

{
    imports =
    [
      ./hardware-configuration.nix # Import hardware scan information.
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enable flakes.

    boot.loader = { # Use systemd-boot as EFI loader.
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    networking = {
        hostName = "nix";
        # wireless.enable = true;     # Wireless support via wpa_supplicant
        networkmanager.enable = true; # Conventional networking

        #proxy = { # Configure network proxy
        #    default = "http://user:password@proxy:port/";
        #    noProxy = "127.0.0.1,localhost,internal.domain";
        #};
    };

    time.timeZone = "Asia/Manila"; # Time zone

    i18n.defaultLocale = "en_PH.UTF-8"; # Locale

    #console = {
    #  font = "Lat2-Terminus16";
    #  keyMap = "us";
    #  useXkbConfig = true; # use xkb.options in tty.
    #};

    services.xserver = { # Enable and configure X11
        enable = true;
        windowManager.i3 = {
            enable = true;
        };
        displayManager.sx.enable = true;

        xkb = { # Configure X11 keymap
            layout = "us";
            options = "eurosign:e,caps:backspace";
        };

        libinput.enable = true; # Touchpad support
    };

    # services.printing.enable = true; # Enable CUPS for printing support

    # Enable sound.
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    users.users.creui = { # Define a user account. Don't forget to set a password with ‘passwd’.
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        shell = pkgs.zsh;
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        pciutils
        neovim
        zsh
        git
        home-manager
    ];

    #programs.home-manager.enable = true;
    
    #home-manager = {
    #    extraSpecialArgs = { inherit inputs; };
    #    users = {
    #        "creui" = import ./home.nix;
    #    };
    #};

    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            fira-code-nerdfont
        ];
    };

    programs.zsh = {
        enable = true;
        setOptions = [
            "AUTO_CD"
            "EXTENDED_GLOB"
            "NO_BARE_GLOB_QUAL"
            "NO_NOMATCH"
            "NO_BEEP"
            "NONOTIFY"
        ];
    };

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "23.11"; # Did you read the comment?

}

