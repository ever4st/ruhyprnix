{ inputs, ... }:

{
  imports = [
    # 1. Забираем только базу Hyprland от Hydenix
    inputs.hydenix.homeModules.hyprland
    
    # 2. Забираем их Waybar (если он вынесен в отдельный модуль)
    inputs.hydenix.homeModules.waybar
    
    # 3. Подключаем Wallbash (скрипты покраски)
    inputs.hydenix.homeModules.wallbash
    
    # Наши кастомные настройки
    ./theme.nix
    ./terminal.nix
    ./shell.nix
    ./base-devel.nix
    ./social.nix
    ./media.nix
  ];
}
