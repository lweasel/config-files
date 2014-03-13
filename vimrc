set rtp+=$PYTHON_2_7_SITE_PACKAGES/powerline/bindings/vim

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Disable help appearing when I accidentally hit F1
nmap <F1> <nop>
vmap <F1> <nop>
imap <F1> <nop>

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

let g:syntastic_always_populate_loc_list = 1

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap [l :lnext<CR>
nnoremap ]l :lprev<CR>

" Command to save to read-only files
cnoremap sudow w !sudo tee % >/dev/null

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Function and key mapping to string trailing whitespace from a file.
" Do this automatically when saving python files.
" (http://vimcasts.org/episodes/tidying-whitespace/)
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <leader>sw :call <SID>StripTrailingWhitespaces()<CR>

autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()


