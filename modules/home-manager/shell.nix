{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings.manager = {
      show_hidden = true;
      sort_by = "mtime";
    };
  };

  # Настроим Zsh, раз ты его выбрал основным
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#no4einb";
      conf = "yazi ~/.config/nixos/"; # Быстрый доступ к конфигам
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "ever4pain";
    userEmail = "your-email@example.com";
  };

  home.packages = with pkgs; [
    fastfetch btop tldr ripgrep fd fzf jq
  ];
}
