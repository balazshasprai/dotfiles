## Prerequisites
`git` and `stow` installed.

## Initial setup
1. `git clone` this repository to your home dir (can be cloned to another dir too, but in that case you need to use `-t ~` with every stow command)
2. Enter the `dotfiles` directory
3. Run the `stow` commands for the configs you need, e.g.  
    - `stow zsh`
    - `stow nvim`
    - `stow tmux`
    - `stow sway`
    - etc..
4. Run `gitignore.sh` (places some `.gitignore` files so the submodules don't freak out)

