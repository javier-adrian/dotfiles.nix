{ pkgs, lib, config, ... }:

let
  currPath = ''~/.config/home-manager/modules/programs/zsh/'';
in
{
  programs.zsh = {
    enable = true;
    profileExtra = ''
      [[ "$(tty)" = "/dev/tty1" ]] && pgrep i3 || sx

      autoload -U colors && colors
    '';
    initExtraBeforeCompInit = ''
      zstyle ':completion:*' menu select
      zstyle ':completion:*' completer _complete _ignored
      zstyle ':completion:*' matcher-list "" "m:{a-zA-z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
      zmodload zsh/complist
      zstyle :compinstall filename 'home/$USER/.zshrc'
    '';
    completionInit = ''
      autoload -Uz compinit
      compinit
      _comp_otions+=(globdots)
    '';
    initExtra = ''
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history

      source '' + currPath + ''powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source '' + currPath + ''.p10k.zsh

      xmodmap -e 'clear lock'
      xmodmap -e 'keycode 22 = Caps_Lock'
      xmodmap -e 'keycode 66 = BackSpace'

      xset r rate 150 35
    '';
    shellAliases = {
      grep = "grep --color=auto";
      ls = "ls -AF --color=auto";
    };
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
