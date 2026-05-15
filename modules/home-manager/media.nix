{ pkgs, ... }:

{
  home.packages = with pkgs; [
    loupe       # Фото (минимализм)
    celluloid   # Видео (на базе mpv)
    amberol     # Музыка (пастельно и красиво)
    thunar      # Твой GUI проводник
    firefox     # Браузер
  ];
}
