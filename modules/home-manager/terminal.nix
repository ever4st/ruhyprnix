{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    themeFile = "Dracula"; # Kitty уже знает про эту тему
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = "0.85"; # Тот самый эффект прозрачности
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
  };
}
