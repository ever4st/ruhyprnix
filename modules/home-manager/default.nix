{ inputs, ... }:

{
  imports = [
    # Подтягиваем дефолтные модули Home Manager из Hydenix
    inputs.hydenix.homeModules.default
    
    # Наши кастомные настройки
    ./theme.nix
    ./terminals.nix
    ./shell.nix
    ./editors.nix
    ./social.nix
  ];
}
