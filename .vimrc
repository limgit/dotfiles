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
Plugin 'leafgarland/typescript-vim'  "TypeScript support for vim

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

"Change color of colorcolumn (cc)
highlight ColorColumn ctermbg=cyan
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

let s:ShowOverLength = 1

augroup highlight_autocmds
  autocmd!
  "call SetOverLength everytime when buffer is loaded to window
  autocmd BufWinEnter * call SetOverLength()
  "call SetOverLength to every window everytime when entering new tab
  autocmd TabEnter * call WinDo('call SetOverLength()')
augroup END

"Apply command to every window
"http://vim.wikia.com/wiki/Run_a_command_in_multiple_buffers
function! WinDo(command)
  let currWin = winnr()
  execute 'windo ' . a:command
  execute currWin . 'wincmd w'
endfunction

function! SetOverLength()
  if s:ShowOverLength == 1
    "Highlight all characters past 80 columns
    "https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
    "https://stackoverflow.com/questions/395114/vim-syntax-coloring-how-do-i-highlight-long-lines-only
    match OverLength /\%>80v.\+/
    set cc=81
  else
    match none
    set cc=0
  endif
endfunction

function! ToggleOverLength()
  let s:ShowOverLength = 1 - s:ShowOverLength
  call WinDo('call SetOverLength()')
endfunction

augroup trailing_whitespace
  autocmd!
  autocmd Syntax * syn match ExtraWhitespace /\s\+$/
augroup END

"For ruby, use 2 space indentation
augroup filetype_ruby
  autocmd!
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
augroup END
"For python, use 4 space indentation
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
augroup END

"Settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {'mode': 'passive'}

"Set pylintrc file for pylint
function! FindRCFile(what, where)
  let cfg = findfile(a:what, escape(a:where, ' ') . ';')
  return cfg !=# '' ? shellescape(cfg) : ''
endfunction

augroup syntastic_python
  autocmd!
  autocmd FileType python let b:syntastic_python_pylint_args = "--rcfile=" . FindRCFile('pylintrc', expand('<afile>:p:h', 1))
augroup END
"End settings for syntastic

"List of mappings
nnoremap <F10> :NERDTreeToggle<CR>
nnoremap <F11> :call ToggleOverLength()<CR>
nnoremap <F12> :SyntasticCheck<CR>:Error<CR>
