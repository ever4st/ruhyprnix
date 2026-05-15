{ pkgs, ... }: {
  # Установка шрифтов (обязательно для иконок в Waybar/Kitty)
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    font-awesome
  ];

  # Настройка GTK (тема Dracula)
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark"; # Отлично сочетается с Dracula
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
    };
  };

  # Чтобы Qt приложения выглядели как GTK (Dracula)
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };
}
