#!/bin/bash

_pwd=$(pwd)

cp -f ${_pwd}/zsh/.oh-my-zsh-plugins.gitignore ${_pwd}/zsh/.oh-my-zsh/plugins/.gitignore
cp -f ${_pwd}/zsh/.oh-my-zsh-themes.gitignore ${_pwd}/zsh/.oh-my-zsh/themes/.gitignore

stow zsh
stow nvim
stow tmux

# Helper function for safe linking
safe_link() {
  local src="$1"
  local dest="$2"

  if [ -L "$dest" ] || [ -e "$dest" ]; then
    echo "Replacing existing link or file: $dest"
    rm -rf "$dest"
  fi

  ln -s "$src" "$dest"
}

safe_link ~/.zsh/themes/dracula-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
safe_link ~/.zsh/plugins/fzf-tab ~/.oh-my-zsh/plugins/fzf-tab
safe_link ~/.zsh/plugins/zsh-completions ~/.oh-my-zsh/plugins/zsh-completions
safe_link ~/.zsh/plugins/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

