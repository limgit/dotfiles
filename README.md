# dotfiles
My custom dotfiles

## About each files
- `.bashrc`: Configuration for `bash`. Copy this file to `~/.bash/custom_bashrc` and add `source "$HOME/.bash/custom_bashrc"` to the end of `~/.bashrc`.
    - or, simply, append the file contents to `~/.bashrc` 😉.
- `.gitconfig`: Global configuration for `git`. Copy this file to `~/.gitconfig` and modify accordingly.
- `.gitignore`: Global configuration to let `git` ignore specific files. Copy this file to `~/.gitignore`.
- `.tmux.conf`: Global configutaion for `tmux`. Copy this file to `~/.tmux.conf`.
- [OUTDATED AS OF 2025-02-26] `.vimrc`: Configuration for `vim`. Need to install [Vundle](https://github.com/VundleVim/Vundle.vim) before using it.
- `aliases.sh`: List of useful aliases.

## List of CLI tools that I use
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder.
- [k9s](https://k9scli.io/): Cool-looking K8S CLI.
- [mise](https://github.com/jdx/mise): An all-in-one version manager.
- [Oh My Zsh](https://ohmyz.sh/): zsh plugin management system.
    - List of official plugins I use often:
        - `git`: Aliases for git commands like `gst`, `gb`.
        - `kubectl`: Aliases for kubectl commands like `kgp`, `kgd`.
    - List of custom plugins I use often:
        - [`alias-tips`](https://github.com/djui/alias-tips): To learn zsh aliases by using it.
        - [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting): Highlight my CLI.
