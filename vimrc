" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set background=dark
colorscheme solarized
set paste
set number
set encoding=utf-8
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <C-n> :NERDTreeToggle<CR>
map <C-c> :PymodeLintAuto<CR>
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set foldmethod=indent
set laststatus=2
set foldlevel=99
set smartindent     " auto-indent things in braces
set expandtab       " away with those pesky tabs
set shiftwidth=4    " number of spaces per indent level
set softtabstop=4   " number of spaces to e.g. delete with backspace

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
let g:Powerline_symbols="fancy"

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

let g:pymode_options_max_line_length = 79
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_completion_bind = '<C-p>'
let g:pymode_indent = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_cwindow = 0
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1

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
