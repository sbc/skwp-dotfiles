" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible
filetype off                    " required by vundle

if has("user_commands")
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  " Load 'vundles'
  source ~/.vim/vundles.vim
endif

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
"
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10:cANSI
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar
  set wildignore+=.git\*,.hg\*,.svn\*         " for Windows

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  "set guifont=Menlo\ Regular:h12
  set guifont=Droid\ Sans\ Mono:h14

  set wildignore+=*/tmp/*,*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.png,*.gif,*.jpg   " for Linux/MacOSX

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif
endif

" ----------------------------------------
" GUI Specific Configuration
" ----------------------------------------

if has('gui_running')

  " Set screen geometry
  set lines=50
  set columns=100

endif

" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set laststatus=2                " always show the statusline
set hidden                      " allow hidden buffers
set history=100
set wildmode=list:longest       " shell-like wildcard matching

"" Whitespace
set wrap                        " wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Color
set background=dark
colorscheme solarized

"" No Bells/Flashes
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"" Key mappings
let mapleader = ","
" Map jj to Esc, but don't move cursor
:imap jj <Esc>`^

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"" File Types
au BufRead,BufNewFile *.hamlc set ft=haml

" -----------------------------
" Plugin-specific Configuration
" -----------------------------

"" Plugins Keys
nnoremap <silent><D-t> :CtrlP<CR>
nnoremap <silent><C-a> :Ack

"" NERDTree
if has("gui_macvim") && has("gui_running")
  :map <D-\> :NERDTreeToggle<CR>
  :imap <D-\> <Esc>:NERDTreeToggle<CR>i
else
  :map <leader>\ :NERDTreeToggle<CR>
  :imap <leader>\ <Esc>:NERDTreeToggle<CR>i
endif

"" NERDCommenter
if has("gui_macvim") && has("gui_running")
  :map <D-/> <plug>NERDCommenterToggle<CR>
  :imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  :map <leader>/ <plug>NERDCommenterToggle<CR>
  :imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>i
endif

"" ControlP
let g:ctrlp_map = '<D-t>'
"let g:ctrlp_custom_ignore = '\.git/*\|\.hg/*\|\.svn/*\|tmp/*\|public/assets/*\|*\.png\|*\.gif\|*\.jpg'
let g:ctrlp_use_caching = 0
let g:ctrlp_mruf_exclude = 'tmp/.*\|temp/.*\|.*swp' " MacOSX/Linux
let g:ctrlp_dotfiles = 0


"" Powerline
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'

