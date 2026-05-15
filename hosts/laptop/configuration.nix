{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    # Модули HydeNix
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    inputs.hydenix.nixosModules.default
    
    # Твои кастомные модули (подключаем папку или конкретные файлы)
    ./modules/system 
    ./hardware-configuration.nix

    # Аппаратная часть для AMD
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];

  # Настройка Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users."ever4pain" = { ... }: {
      imports = [
        inputs.hydenix.homeModules.default
        ./modules/hm # Здесь будут лежать настройки Kitty, Neovim, Dracula
      ];
    };
  };

  # Твой пользователь
  users.users.ever4pain = {
    isNormalUser = true;
    initialPassword = "qwerty"; # Смени его сразу после входа командой passwd
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker"];
    shell = pkgs.zsh; 
  };

  # Настройки HydeNix
  hydenix = {
    enable = true; 
    hostname = "nixos-ever"; 
    timezone = "Europe/Moscow"; # Твой часовой пояс
    locale = "en_CA.UTF-8";
  };

  # Включаем экспериментальные фичи для работы Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualization.docker.enable = true;
  virtualization.podman.enable = true;

  nixpkgs.config.allowUnmarkedBroken = true;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
