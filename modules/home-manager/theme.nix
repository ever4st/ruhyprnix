{ pkgs, ... }: {
  # Установка шрифтов (обязательно для иконок в Waybar/Kitty)
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    font-awesome
    dracula-theme        # Основная тема GTK
    layan-gtk-theme      # Пастельная альтернатива для разнообразия
    papirus-icon-theme   # Иконки (лучше всего подходят под Dracula)
    dracula-cursors      # Курсоры
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
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    # Это заставит GTK 4 приложения тоже использовать темную тему
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;

  };

  # Чтобы Qt приложения выглядели как GTK (Dracula)
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };
  home.sessionVariables = {
    XCURSOR_SIZE = "24";
    HYPRCURSOR_SIZE = "24";
    GTK_THEME = "Dracula";
  };
}
