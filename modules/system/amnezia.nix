{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.amnezia-vpn ];
  
  # Amnezia часто использует туннели, разрешаем форвардинг трафика
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;
}
