{ pkgs, ... }:

{
  imports = [
    ./amnezia.nix
    ./postgres.nix
    ./bluetooth.nix
    # Добавляй сюда новые файлы по мере создания
  ];
}
