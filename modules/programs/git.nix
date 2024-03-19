{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userEmail = "agjavier@kld.edu.ph";
        userName = "Adrian Javier";
    };
}
