set rtp+=/home/odando/.local/lib/python2.7/site-packages/powerline/bindings/vim

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Disable help appearing when I accidentally hit F1
:nmap <F1> <nop>

" Save in all modes with fewer keypresses
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Quit in all modes with fewer keypresses
nmap <c-q> :q<CR>
vmap <c-q> <Esc><c-s>
imap <c-q> <Esc><c-s>

syntax on

let mapleader = ','

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
