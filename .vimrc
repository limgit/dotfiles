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
Plugin 'vim-syntastic/syntastic'  "Syntax checker for vim
Plugin 'tpope/vim-fugitive'  "Git integration for vim

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
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %{fugitive#statusline()}\ %F

set hlsearch  "highlight search
set autoread  "automatically read file when file is modified outside
set ruler  "display current cursor position

set cc=81  "Guideline for 80 characters rule
"Change color of colorcolumn (cc)
highlight ColorColumn ctermbg=cyan

"Highlight all characters past 80 columns
"https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
"https://stackoverflow.com/questions/395114/vim-syntax-coloring-how-do-i-highlight-long-lines-only
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  autocmd BufEnter * match OverLength /\%>80v.\+/
augroup END

"For ruby, use 2 space indentation
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
"For python, use 4 space indentation
autocmd FileType python setlocal shiftwidth=4 tabstop=4

"Settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0

"Set pylintrc file for pylint
function! FindRCFile(what, where)
  let cfg = findfile(a:what, escape(a:where, ' ') . ';')
  return cfg !=# '' ? shellescape(cfg) : ''
endfunction

autocmd FileType python let b:syntastic_python_pylint_args = "--rcfile=" . FindRCFile('pylintrc', expand('<afile>:p:h', 1))

nnoremap <F12> :SyntasticCheck<CR>:Error<CR>
"End settings for syntastic
