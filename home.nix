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
        fuzzel
        noctalia-shell
        brightnessctl playerctl libnotify
        wayland-utils wev wl-clipboard xwayland-satellite

        # Essentials
        gdb
        fd file ripgrep 
        fzf
        unzip zip gzip
        jq curl
        cmake gnumake 
        cargo

        # Development
        gcc
        python3
        iverilog
        nasm

        # Utilities
        (nnn.override { withNerdIcons = true; })
        bc lsd bat tealdeer
        stow btop tmux
        taskwarrior3 super-productivity

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
        plugins = [{
            name = "zsh-vi-mode";
            src = pkgs.zsh-vi-mode;
            file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }];
        initContent = "source /home/akshit/shellscripts/init.sh";
    };
}
