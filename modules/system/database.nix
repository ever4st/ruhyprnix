{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
    ensureDatabases = [ "ever_db" ];
    authentication = pkgs.lib.mkForce ''
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
    '';
  };

  environment.systemPackages = with pkgs; [
    sqlite
  ];
}
