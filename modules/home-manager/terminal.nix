{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = "0.85";
      dynamic_background_opacity = "yes"; # Позволяет менять прозрачность на лету
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      # Важно для Hyprland blur:
      window_padding_width = 4;
      hide_window_decorations = "yes";
    };
  };
}
