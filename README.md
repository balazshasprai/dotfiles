## Prerequisites
`git` and `stow` installed.

## Initial setup
1. `git clone` this repository to your home dir (can be cloned to another dir too, but in that case you need to use `-t ~` with every stow command)
2. Enter the `dotfiles` directory
3. Run `setup.sh` (sets up zsh/oh-my-zsh, tmux, nvim, and submodule .gitignores)
4. Run additional `stow` commands for the configs you need, e.g.  
    - `stow sway`

