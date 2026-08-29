{ pkgs, ... }:

{
  imports = [
    ./git.nix
  ];

  users.users.icy = {
    isNormalUser = true;
    description = "icy";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" "kvm" ];
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "INC_APPEND_HISTORY"
      "SHARE_HISTORY"
      "HIST_IGNORE_ALL_DUPS"
      "HIST_SAVE_NO_DUPS"
      "HIST_REDUCE_BLANKS"
    ];

    shellAliases = {
      btop = "btop --force-utf";
      sudo = "sudo ";
      v = "nvim";
      ff = "fastfetch";

      # NixOS Git Workflow
      nixadd     = "git -C ~/.config/nixos add -A";
      nixcommit  = "git -C ~/.config/nixos commit -m";
      nixpush    = "git -C ~/.config/nixos push origin main --force";
      nixpull    = "git -C ~/.config/nixos pull origin main";
      nixstatus  = "git -C ~/.config/nixos status";
      nixrebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#nix";
      nixupdate  = "nix flake update --flake ~/.config/nixos && sudo nixos-rebuild switch --flake ~/.config/nixos#nix";
      nixclean   = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      nixflakeupdate = "nix flake update --flake ~/.config/nixos";

      # Container / VM controls
      docker-start = "sudo systemctl start docker";
      docker-stop  = "sudo systemctl start docker";
      win          = "sdl-freerdp /u:\"icy\" /p:\"1771\" /v:127.0.0.1:3389 /cert:ignore /dynamic-resolution +clipboard /sound /microphone +home-drive";
      win-start    = "sudo systemctl start docker && docker start windows";
      win-stop     = "docker stop windows && sudo systemctl stop docker";
    };

    shellInit = ''
      export PATH="$HOME/.local/bin:$PATH"

      nixfrost() {
        local day=$(date +%-d)
        local suffix="th"
        case "$day" in
          1|21|31) suffix="st" ;;
          2|22)    suffix="nd" ;;
          3|23)    suffix="rd" ;;
        esac

        local timestamp="$(date +"%-d$suffix %b, %Y at %H:%M")"

        sudo -v || return 1

        nix flake update --flake ~/.config/nixos && \
        git -C ~/.config/nixos add -A && \
        sudo nixos-rebuild switch --flake ~/.config/nixos#nix && \
        sudo nix-collect-garbage -d && \
        nix-collect-garbage -d && \
        git -C ~/.config/nixos commit -m "ran \"nixfrost\" on $timestamp" && \
        git -C ~/.config/nixos push origin main
      }
    '';

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "copypath" ];
    };

    promptInit = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
