"****************************************
" General editor properties
"****************************************

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set autowrite " Save file when moving away from buffer
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

syntax on

"****************************************
" Colouring
"****************************************

" Muted colour for line numbers
highlight LineNr ctermfg=darkgrey


" Make comments a little brighter
highlight Comment ctermfg=lightblue

"****************************************
" Set up powerline
"****************************************

set rtp+=$PYTHON_2_7_SITE_PACKAGES/powerline/bindings/vim

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"****************************************
" Manage plugins with Vundle
"****************************************

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'Raimondi/delimitMate'

"****************************************
" Keyboard remappings and shortcuts
"****************************************

let mapleader = ','

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

" Command to save to read-only files
cnoremap sudow w !sudo tee % >/dev/null

" Toggle visibility of hidden characters
nnoremap <leader>l :set list!<CR>

" Quicker (for me) handling of multiple windows
nnoremap <leader>ww <c-w>w
nnoremap <leader>wo <c-w>o
nnoremap <leader>ws <c-w>s

" Stop accidentally entering recording mode
nnoremap Q q
nnoremap q <Nop>

" Toggle search highlighting on/off, and show current value.
nnoremap <leader><Space> :set hlsearch! hlsearch?<CR>

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

" Make it easier to edit files in the same directory as the current file
" (http://vimcasts.org/episodes/the-edit-command/)
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%

" Easy editing of vimrc file, and source vimrc file after editing it
nmap <leader>v :edit $MYVIMRC<CR>

autocmd BufWritePost .vimrc source $MYVIMRC

" Various shortcuts for plugin functionality
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
