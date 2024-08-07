{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    history.path = "${config.xdg.dataHome}/zsh/history";
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles#$(hostname)";
      cat = "bat";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" "sudo" "pass"
      ];
      theme = "robbyrussell";
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
        file = "share/zsh-completions/zsh-completions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];
  };
}
