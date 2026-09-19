{ config, pkgs, inputs, ... }:

{
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
    fuzzel j4-dmenu-desktop
    noctalia-shell
    brightnessctl playerctl libnotify
    wayland-utils wev wl-clipboard xwayland-satellite

    # Development
    gcc
    gdb
    python3
    iverilog
    nasm

    # Utilities
    (nnn.override { withNerdIcons = true; })
    bc lsd bat tealdeer
    fd file ripgrep
    unzip zip gzip
    jq curl
    cmake gnumake cargo
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
    initContent = "source /home/akshit/shellscripts/init.sh";
  };
}
