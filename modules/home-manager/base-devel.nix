{ pkgs, ... }:

{
  home.packages = with pkgs; [
    micro
    neovim
    
    # Зависимости для компиляции и разработки (из твоего списка)
    gcc
    gnumake
    cmake
    gdb
    wget
  ];

  # Настроим micro, чтобы он сразу был удобным
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "dracula";
      tabsize = 4;
    };
  };
}
