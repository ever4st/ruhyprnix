{ pkgs, ... }:

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
