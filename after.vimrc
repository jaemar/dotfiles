let mapleader = ";"
set relativenumber
set mouse=a
set wrap
set et sts=0 sw=2 ts=2

autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

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
