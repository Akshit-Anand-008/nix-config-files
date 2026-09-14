{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];
  home.username = "akshit";
  home.homeDirectory = "/home/akshit";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    # Neovim
    neovim
    nil clang-tools lua-language-server
    tree-sitter

    # Desktop
    alacritty
    fuzzel
    brightnessctl playerctl libnotify
    wayland-utils wev wl-clipboard xwayland-satellite

    # Development
    gcc gdb
    python3
    iverilog
    nasm

    # CLI Utilities
    (nnn.override { withNerdIcons = true; })
    bc lsd bat tealdeer
    fd file ripgrep
    unzip zip gzip
    jq curl
    cmake gnumake
    stow fzf tmux
    taskwarrior3 btop

    # Aesthetics
    bibata-cursors
    nerd-fonts.jetbrains-mono
    starship

    # Others
    thunderbird
    mpv
    (texliveBasic.withPackages (ps: with ps; [ latexmk ]))
    libreoffice pdfarranger
    zathura kdePackages.okular
  ];

  programs.noctalia-shell.enable = true;
}
