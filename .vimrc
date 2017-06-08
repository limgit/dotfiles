set nocompatible  "be iMproved, required
filetype off  "required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'The-NERD-tree'  "File system explorer
Plugin 'ctrlpvim/ctrlp.vim'  "Project file search in vim

"All of your Plugins must be added before the following line
call vundle#end()  "required
filetype plugin indent on  "required

"Syntax Highlighting
if has("syntax")
	syntax on
endif
set autoindent
set cindent
set nu  "Line number

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
	set noexpandtab  "maintain tab of makefile
else
	set expandtab  "substitue every tab to space
endif

set tabstop=2  "tab stop (shortly, ts)
set softtabstop=2
set shiftwidth=2  "auto indentation configuration

set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F

set hlsearch  "highlight search
set autoread  "automatically read file when file is modified outside
set ruler  "display current cursor position

"For ruby, use 2 space indentation
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
"For python, use 4 space indentation
autocmd FileType python setlocal shiftwidth=4 tabstop=4

