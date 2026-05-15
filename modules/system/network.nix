{ pkgs, ... }: {
  networking.networkmanager.enable = true;
  
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Пакет для VPN
  environment.systemPackages = [ pkgs.amnezia-vpn ];
}
