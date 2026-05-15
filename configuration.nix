{ config, pkgs, inputs, ... }:

{
  # 1. Настройки загрузчика (Systemd-boot — стандарт для UEFI)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # 2. Сетевые настройки
  networking.hostName = "nixos-ever"; # Название твоего ПК в сети
  networking.networkmanager.enable = true; # Включаем интернет (Wi-Fi/Ethernet)

  # 3. Видеодрайвер AMD
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # 4. Включаем поддержку Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # 5. Настройка звука (Pipewire — современный стандарт)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # 6. Настройка пользователя
  users.users.ever4pain = {
    isNormalUser = true;
    description = "ever4pain";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    # Мы не ставим здесь GUI-пакеты, их мы вынесем в Home Manager
    packages = with pkgs; [];
  };

  # 7. Системные пакеты (минимум для выживания)
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    btop
    home-manager # Чтобы он всегда был под рукой
  ];

  # 8. Включаем поддержку Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 9. Таймзона и локаль
  time.timeZone = "Europe/Moscow"; # Замени на свою, если нужно
  i18n.defaultLocale = "en-US.UTF-8";

  # Версия системы (не меняй её после установки)
  system.stateVersion = "23.11"; 
}
