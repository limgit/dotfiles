# dotfiles
My custom dotfiles

## Prerequisites
 - git
 - vim
 - make
 
## How to use
 1. `$ git clone https://github.com/limgit/dotfiles.git && cd dotfiles`
 2. Run `$ make USERNAME=<username> EMAIL=<email>`
 3. Files are deployed now
 4. You can also deploy each files seperately as following examples:
    - `$ make vimrc`: Run `vimrc-deploy.sh`
    - `$ make gitconfig USERNAME=<username> EMAIL=<email>`: Run `gitconfig-deploy.sh` with given username and email

### Each deploy file's behavior
 - **vimrc-deploy.sh**: Install `Vundle` and copy `.vimrc` to `~/.vimrc`. After that, install all the Vundle plugins named
 - **gitconfig-deploy.sh**: Create new `~/.gitconfig` with given user name and email. After that, append the content of `.gitconfig` to `~/.gitconfig`
 - **bashrc-deploy.sh**: Copy `.bashrc` to `~/.bash/custom_basrc`. After that, the instruction of what to do is printed
