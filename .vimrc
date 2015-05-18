let $PATH = "~/.pyenv/shims:".$PATH

syntax on
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set whichwrap=b,s,h,l,<,>,[,]
set nu
set laststatus=2
set t_Co=256
set nobackup
set noundofile
set clipboard+=unnamed
set clipboard-=autoselect
set hidden
set confirm
set showmatch
set matchtime=3
set smarttab
set spelllang+=cjk
" search option
set ignorecase
set smartcase
set incsearch
set hlsearch

set nowrap
set textwidth=0
set colorcolumn=80

set cursorline
set cursorcolumn

" NeoBundle ---------------------------------------------------------
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'kmnk/vim-unite-giti'
"NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'davidhalter/jedi-vim'
NeoBundleLazy 'lambdalisue/vim-pyenv', {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

NeoBundle 'Yggdroot/indentLine'
"NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'sentientmachine/Pretty-Vim-Python'
NeoBundle 'LeafCage/foldCC.vim'

"Color schemes ------------------------
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'cocopon/lightline-hybrid.vim'  "lightline color scheme

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" End NeoBundle -----------------------------------------------------

" Syntastic ---------------------------
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" IndentLine --------------------------
let g:indentLine_char="|"
let g:indentLine_color_term=239
let g:indentLine_color_gui='#505050'
set list listchars=tab:\|\ ,trail:_

" Unite -------------------------------
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1

nnoremap [unite] <Nop>
nmap ,u [unite]

nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]u :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> [unite]o :<C-u>Unite -direction=botright -vertical -winwidth=40 outline<CR>

" QuickRun ----------------------------
"let g:quickrun_config = {
"      \  '_': {
"      \    'hook/time/enable': '1',
"      \    'outputter/buffer/split': ':botright 10sp'
"      \  },
"      \}
"let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split': 'below'}

"python test by QuickRun
"autocmd BufWinEnter,BufNewFile test*.py set filetype=python.test
"let g:quickrun_config['python.test'] = {'command': 'py.test', 'cmdopt': '-s -v'}

"Setting for lightline ----------------
let g:lightline = {
    \ 'colorscheme': 'hybrid'
    \}

" Colorcheme setting ------------------
if !has('win32')
  colorscheme molokai
endif
highlight Normal ctermbg=none

" Zenkaku -----------------------------
" Show 2byte space
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


" NeoComplete -------------------------
if neobundle#is_installed('neocomplete')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : ''
        \ }

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " key-mappings
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

elseif neobundle#is_installed('neocomplcache')
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : ''
        \ }

    " key-mappings
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
endif

" NeoSnippet --------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" jedi-vim ----------------------------
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#rename_command = '<Leader>R'
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if neobundle#is_installed('neocomplete')
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
elseif neobundle#is_installed('neocomplcache')
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
endif
autocmd FileType python setlocal completeopt-=preview

" Key maps ----------------------------------------------------------
inoremap <C-l> <Del>
nnoremap <CR> i<CR><Esc>
inoremap <silent> jj <ESC>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap s <Nop>
nnoremap sp :<C-u>set paste<CR>"*p<Esc>:<C-u>set nopaste<CR>
nnoremap sy :<C-u>Unite history/yank<CR>
nnoremap sb :<C-u>Unite buffer<CR>
nnoremap sf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap sr :<C-u>Unite -buffer-name=register register<CR>
nnoremap su :<C-u>Unite file_mru buffer<CR>
nnoremap so :<C-u>Unite -direction=botright -vertical -winwidth=40 outline<CR>

nnoremap <Space>w  :<C-u>w<CR>

nnoremap <Space>h  ^
vnoremap <Space>h  ^
nnoremap <Space>l  $
vnoremap <Space>l  $

nnoremap <Space>o  zo
nnoremap <Space>O  zO
nnoremap <Space>c  zc
nnoremap <Space>C  zC
nnoremap <Space>i  zi

nnoremap x "_x
" nnoremap q <C-w>
nnoremap <silent><C-^> <Nop>
nnoremap <ESC><ESC> :nohlsearch<CR>
set whichwrap=b,s,h,l,<,>,[,]
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap G Gzz

nnoremap <silent>sp :bprevious<CR>
nnoremap <silent>sn :bnext<CR>
nnoremap <silent>ss :b#<CR>

" File types --------------------------
au BufNewFile,BufRead *.md :set filetype=markdown
au BufNewFile,BufRead *.html :set filetype=htmldjango

autocmd! FileType cpp setlocal shiftwidth=2
autocmd! FileType c setlocal shiftwidth=2
" Folding -----------------------------
set foldtext=FoldCCtext()
set foldmethod=indent
set foldcolumn=4
set nofoldenable
