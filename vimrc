syntax on

" Prevent netrw from loading...
let loaded_netrwPlugin = 1

set incsearch
set lazyredraw
set expandtab
set termencoding=utf-8
set encoding=utf-8
set smarttab
set sts=2
set shiftwidth=2
set tabstop=2
set ai "Auto indent"
set si "Smart indent"
set shiftround
set number
set bs=2 "for macports vim
set t_Co=256
set background=dark
set tags=tags;$HOME/.tags
set notimeout
set nocompatible
set ttimeout
set ttimeoutlen=10
set ttyfast
set directory=~/.vim/tmp/swap
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
set backup
set undofile
set undolevels=1000
set undoreload=10000
set hidden
set scrolloff=20
colorscheme molokai
hi Search cterm=NONE ctermfg=088 ctermbg=154
set hlsearch
" Press Space to turn off highlighting and clear any messages already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set ignorecase
set smartcase

set wildmode=longest:full
set wildmenu

set foldmethod=indent
set foldlevel=10
set foldlevelstart=20
set foldnestmax=2

set nowrap
set cursorline


call pathogen#infect()
filetype on
filetype plugin on
filetype plugin indent on

" Return to last edit position when opening files (You want this!)
" ---> This code has errors.  Need to debug.
"autocmd BufReadPost *
"     \ if line("'\") > 0 && line("'\") <= line("$") |
"     \   exe "normal! g`\" |
"     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.* :call DeleteTrailingWS()

" Uncrustify
autocmd FileType c noremap <buffer> <c-f> :call Uncrustify('c')<CR>
autocmd FileType c vnoremap <buffer> <c-f> :call RangeUncrustify('c')<CR>
autocmd FileType cpp noremap <buffer> <c-f> :call Uncrustify('cpp')<CR>
autocmd FileType cpp vnoremap <buffer> <c-f> :call RangeUncrustify('cpp')<CR>

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <kPageUp> :tabprevious<CR>
map <silent> <kPageDown> :tabnext<CR>
map <silent> <C-J> :tabprevious<CR>
map <silent> <C-K> :tabnext<CR>
imap <silent> <C-T> <ESC>:tabnew<CR>i
imap <silent> <C-W> <ESC>:tabclose<CR>i
imap <silent> <kPageUp> <C-O>:tabprevious<CR>
imap <silent> <kPageDown> <C-O>:tabnext<CR>
map <silent> <C-H> :tabfirst<CR>
imap <silent> <C-H> <C-O>:tabfirst<CR>

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol         = '✗'
let g:syntastic_style_error_symbol   = '✗'
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let c_no_curly_error   = 1
let g:localrc_filename = '.lvimrc'

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" vim-latex
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf='/usr/bin/open -a Preview'

" aliases (shameless stolen form vimmeh)
autocmd VimEnter * call DoAliases()
function! DoAliases()
    Alias W w
    Alias Wq wq
    Alias Wqall wqall
    Alias Q q
    Alias Qw wq
    Alias Qall qall
endfunction

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python let b:did_ftplugin = 1
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:jscomplete_use = ['dom', 'moz', 'xpcom', 'es6th']

autocmd InsertLeave * set cursorline
autocmd InsertEnter * set cursorline


autocmd FileType c noremap <buffer> <c-f> :call Uncrustify('c')<CR>
autocmd FileType c vnoremap <buffer> <c-f> :call RangeUncrustify('c')<CR>
autocmd FileType cpp noremap <buffer> <c-f> :call Uncrustify('cpp')<CR>
autocmd FileType cpp vnoremap <buffer> <c-f> :call RangeUncrustify('cpp')<CR>

" NERDTree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/']

" NERDTree-Tabs
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 2

let g:Tlist_Use_Right_Window = 1
"let g:Tlist_Auto_Open = 1

" no matter your colorscheme, you'll have a vertical bar when you split.
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#555552 guibg=#555552 gui=NONE
set fillchars+=vert:\


"highlight column 80
hi ColorColumn ctermbg=234 ctermfg=Gray guibg=#404040
command SkinnyMargin set cc=73
command WideMargin set cc=80
command NoMargin set cc=

"GitGutter
let g:gitgutter_eager = 0
au VimEnter * GitGutterEnable

let g:clang_exec = "/usr/bin/clang"
let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"

"python-mode
let g:pymode_rope_vim_completion = 0
let g:pymode_rope_guess_project = 0
let g:pymode_virtualenv = 1
"
