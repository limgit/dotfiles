# dotfiles
My custom dotfiles

## Prerequisites
 - git
 - vim
 
## How to use
 1. `$ git clone https://github.com/limgit/dotfiles.git && cd dotfiles`
 2. Run each deploy files as you want
 3. Files are deployed now

### Each deploy file's behavior
 - **vimrc-deploy.sh**: Install `Vundle` and copy `.vimrc` to `~/.vimrc`. After that, install all the Vundle plugins named
 - **gitconfig-deploy.sh**: Create new `~/.gitconfig` with given user name and email. After that, append the content of `.gitconfig` to `~/.gitconfig`
 - **bashrc-deploy.sh**: Copy `.bashrc` to `~/.bash/custom_basrc`. After that, the instruction of what to do is printed
