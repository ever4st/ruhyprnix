{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./hardware.nix
    ./network.nix
    ./sddm.nix
    ./amnezia.nix  # Твой VPN
    ./database.nix # Базы данных (Postgres/Sqlite)
    # Добавляй сюда новые файлы по мере создания

    #./boot.nix
    #./nix.nix
    #./system.nix
  ];
}
