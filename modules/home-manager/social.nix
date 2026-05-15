{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ayugram-desktop # Твой выбор для Telegram
    # discord       # Если нужно
    # slack         # Для работы
  ];
}
