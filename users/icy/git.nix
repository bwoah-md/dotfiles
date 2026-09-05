{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      safe.directory = [ "/etc/nixos" ];
      user = {
        name = "bwoah-md";
        email = "143240188+bwoah-md@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "${pkgs.helix}/bin/hx";
      core.hooksPath = "/etc/nixos-git-hooks";
      credential.helper = "store";
    };
  };

  environment.etc."nixos-git-hooks/post-commit" = {
    source = pkgs.writeShellScript "post-commit" ''
      #!/usr/bin/env bash
      # Auto-push whenever committing inside the dotfiles repo specifically —
      # core.hooksPath is global, this guard keeps it from firing in other repos.
      repo_root="$(git rev-parse --show-toplevel 2>/dev/null)"
      if [ "$repo_root" = "/home/icy/dotfiles" ]; then
        git push origin main
      fi
    '';
    mode = "0755";
  };
}
