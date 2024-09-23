#!/bin/sh

git clone https://github.com/zsh-users/antigen.git ~/antigen

wget https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh -O ~/.fzf-git.sh

wget https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/refs/heads/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh -O ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# use bat as a pager for man
echo "export MANPAGER=\"sh -c 'col -bx | bat -l man -p'\"" > ~/.env

cat <<EOF >> ~/.env
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
EOF
