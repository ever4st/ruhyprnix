{ pkgs, ... }:

{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true; # Включаем поддержку Wayland для SDDM
      theme = "sugar-candy"; # Одна из самых красивых и кастомизируемых тем
    };
  };

  environment.systemPackages = with pkgs; [
    # Пакеты для темы SDDM
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg
    
    # Сама тема (ставим её как системный пакет)
    (pkgs.stdenv.mkDerivation {
      name = "sddm-theme-sugar-candy";
      src = pkgs.fetchFromGitHub {
        owner = "Kangie";
        repo = "sddm-sugar-candy";
        rev = "a1fae5159c8c7e44f0d8de124b14bae583edb5b8";
        sha256 = "sha256-S6p6p9m9N5C6M6X6O6P6Q6R6S6T6U6V6W6X6Y6Z6A6B="; # Nix сам подскажет правильный хеш при ошибке
      };
      installPhase = ''
        mkdir -p $out/share/sddm/themes/sugar-candy
        cp -R . $out/share/sddm/themes/sugar-candy
      '';
    })
  ];
}
