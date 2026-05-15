{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "mtime";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "ever4pain";
    userEmail = "your-email@example.com"; # Не забудь поменять
  };

  # Дополнительные утилиты для разработки
  home.packages = with pkgs; [
    fastfetch # Красивый вывод инфо о системе
    btop      # Монитор ресурсов
    tldr      # Короткие справки по командам
    ripgrep
    fd
    fzf
    jq
    direnv
  ];
}
