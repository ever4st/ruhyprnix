{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "layan";
  };

  environment.systemPackages = with pkgs; [
    # Зависимости для темы Layan
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg

    (stdenv.mkDerivation {
      name = "sddm-theme-layan";
      src = fetchFromGitHub {
        owner = "vinceliuice";
        repo = "Layan-kde";
        rev = "f56515438865463f237f37473b64c6778f6911c4"; # Актуальный коммит
        sha256 = "sha256-4YtYIitYpYsh4N07f4Gj0D9DkC8XW8E7S6Z6G6+S6U8=";
      };
      installPhase = ''
        mkdir -p $out/share/sddm/themes/layan
        cp -R sddm/* $out/share/sddm/themes/layan
      '';
    })
  ];
}{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "layan"; # Меняем на Layan
  };

  environment.systemPackages = [
    # Кастомная сборка темы Layan для SDDM
    (pkgs.stdenv.mkDerivation {
      name = "sddm-theme-layan";
      src = pkgs.fetchFromGitHub {
        owner = "vinceliuice";
        repo = "Layan-kde";
        rev = "master"; # Или конкретный хэш для стабильности
        sha256 = "sha256-0000000000000000000000000000000000000000000="; # Nix подскажет правильный
      };
      installPhase = ''
        mkdir -p $out/share/sddm/themes/layan
        cp -R sddm/* $out/share/sddm/themes/layan
      '';
    })
  ];
}
