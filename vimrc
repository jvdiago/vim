call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
" solarized colorscheme
Plug 'altercation/vim-colors-solarized'
" Right way to handle trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'
" Unite
"   depend on vimproc
"   you have to go to .vim/plugin/vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
" GIT
Plug 'tpope/vim-fugitive'
Plug 'powerline/powerline'

Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'tell-k/vim-autopep8'
call plug#end()

set rtp+=~/.vim/plugged/powerline/powerline/bindings/vim
set laststatus=2
let g:Powerline_symbols="fancy"

syntax on
let python_highlight_all=1
let g:syntastic_python_checkers = ['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_python_flake8_args='--ignore=E501'
set number

set background=dark
colorscheme solarized

set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99


au BufNewFile,BufRead *.py
    \ set textwidth=79

au BufNewFile,BufRead *.py
    \ set colorcolumn=80

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let g:autopep8_disable_show_diff=1

let g:ycm_filetype_whitelist = { 'python':1 }
let g:ycm_autoclose_preview_window_after_completion=1
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <C-n> :NERDTreeToggle<CR>


" Keys:
" <space><space> Fuzzy search
" <space>f      Unite search
" <space>b      bookmarks
" º             Search word on all files in current dir
" <space>/      Search word in all files in current dir
" za/zc         Fold/unfold
" {i}gt         Change to #i tab
" :tabn         Change to next tab
" Ctrl-w        Change buffer in split window
" :tabedit      Open a new tab
" :e            Open a new buffer
" F8            Go to next buffer
" :[v]split     Split the layout
" K             Show python docs
" <Ctrl-p>      Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)


" ----------------------------
"       File Management
" ----------------------------
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :vsplit<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>f :vsplit<cr> :<C-u>Unite file<cr>
nnoremap <space>g :vsplit<cr> :<C-u>Unite -start-insert file_rec/git<cr>
nnoremap <space>b :<C-u>Unite buffer bookmark<CR>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" --- type ° to search the word in all files in the current dir
nmap º :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag
