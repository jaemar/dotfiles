let mapleader = ";"
set relativenumber
set mouse=a
set wrap
" set et sts=0 sw=2 ts=2

autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
" autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
" au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

au InsertEnter * :set number
au InsertEnter * :inoremap jj <ESC>
au InsertLeave * :set relativenumber

" set relativenumber
au BufRead,BufNewFile *.* set relativenumber
" update/save
au BufRead,BufNewFile *.* nmap <leader>s :wa!<CR>
" quit
au BufRead,BufNewFile *.* nmap <leader>q :q<CR>
" select all
au BufRead,BufNewFile *.* nmap <leader>a ggVG
" Toggle NERDTree
au BufRead,BufNewFile *.* nmap <leader>n :NERDTreeToggle<CR> :set relativenumber<CR>
" Vertical Split
au BufRead,BufNewFile *.* nmap <leader>v :vs<CR>
" Horizontal Split
au BufRead,BufNewFile *.* nmap <leader>i :split<CR>
" Move window
au BufRead,BufNewFile *.* nmap <tab> <c-w>w
" Save and Quit
au BufRead,BufNewFile *.* nmap <leader>w :wq<CR>
" Remove Highlight
au BufRead,BufNewFile *.* nmap <leader>hh :noh<CR>
" Open folded shit
au BufRead,BufNewFile *.* nmap <leader><space> ;c<Space>
" Open folded shit
au BufRead,BufNewFile *.* nmap <leader><space> ;c<Space>
" Copy to clipboard
au BufRead,BufNewFile *.* nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
au BufRead,BufNewFile *.* imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
au BufRead,BufNewFile *.* nmap <leader>y :.w !pbcopy<CR><CR>
au BufRead,BufNewFile *.* vmap <leader>y :w !pbcopy<CR><CR>


" Neovim
set nocompatible
filetype on
filetype off

let mapleader = ";"


call plug#begin('~/.local/share/nvim/plugged')
" call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'

" Prettify
Plug 'tomasr/molokai'

" File Management
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'toyamarinyon/vim-swift'
Plug 'tpope/vim-fugitive'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Syntax
Plug 'neomake/neomake'

" golden ratio
Plug 'roman/golden-ratio'
call plug#end()

" General

filetype plugin indent on

" NerdTree
nmap <leader>n :NERDTreeToggle<CR> :set relativenumber<CR>

" Color Scheme
colorscheme molokai

" JSX Syntax Highlighting
let g:jsx_ext_required = 0
let g:neomake_javascript_enabled_makers = ['eslint']

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set backspace=indent,eol,start

" Backups
set directory=~/.vim/tmp/swap/ " swap files
set noswapfile

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

set showcmd

set syntax=enable

set t_Co=256
set mouse=a
set number
set nofoldenable

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*,*/tmp/*,*/deps/*

nn <leader>s :wa!<CR>
nn <leader>q :q<CR>
nn <leader>a ggVG
nn <tab> <c-w>w
nn <leader>n :NERDTreeToggle<cr> :set relativenumber<CR>
nn <leader>v :vs<CR>
nn <leader>i :split<CR>
nn <leader>w :wq<CR>
nn <leader>hh :noh<CR>

" CTRL+P for fzf
nmap <C-P> :FZF<CR>

" Allow ctrl-C to copy lines to clipboard
set clipboard=unnamedplus

let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
elseif os == 'Linux'
  vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
endif

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Triggers
autocmd! BufWritePost .vimrc source ~/.vimrc
autocmd! BufWritePost * Neomake
au BufNewFile,BufRead *.gradle setf groovy
au BufRead,BufNewFile *.* set relativenumber

au InsertEnter * :set number
au InsertEnter * :inoremap jj <ESC>
au! InsertLeave * :set relativenumber
