{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./nix.nix
    ./sddm.nix
    ./system.nix
    ./amnezia.nix  # Твой VPN
    ./db.nix       # Базы данных (Postgres/Sqlite)
    # Добавляй сюда новые файлы по мере создания
  ];
}
