let $PATH = "~/.pyenv/shims:".$PATH

syntax on
set shiftwidth=4
set tabstop=4
set expandtab
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set nu
set autoindent
set laststatus=2
set t_Co=256
set nobackup
set noundofile
set nowrap
set clipboard=unnamed
set hidden
set confirm
set showmatch
set smarttab
set spelllang+=cjk

imap <C-l> <del>

nnoremap x "_x
nnoremap s "_s
nnoremap q <C-w>
nnoremap <silent><C-^> <Nop>

"TagList.vim
"sudo apt-get install exuberant-ctags
set tags=tags
"let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File = 1             " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1          " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1           " taglistのウインドウだけならVimを閉じる
let Tlist_WinWidth = 50
map <silent> <leader>l :TlistToggle<CR> " \lでtaglistウインドウを開いたり閉じたり出来るショートカット


" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        "ZenkakuSpace をカラーファイルで設定するなら、
        "次の行をコメントアウト
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"NeoBundle
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'soramugi/auto-ctags.vim'
"NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

NeoBundle 'davidhalter/jedi-vim'
NeoBundleLazy 'lambdalisue/vim-pyenv', {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

NeoBundle 'Yggdroot/indentLine'
"indentLine
let g:indentLine_char="|"
let g:indentLine_color_term=239
let g:indentLine_color_gui='#505050'
set list listchars=tab:\|\ 
"NeoBundle 'bronson/vim-trailing-whitespace'


"Color scheme
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'cocopon/lightline-hybrid.vim'  "lightline color scheme

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"Setting for Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"setting for jedi-vim
let g:jedi#rename_command = '<Leader>R'
let g:jedi#popup_select_first = 0
autocmd FileType python setlocal completeopt-=preview

"setting for QuickRun
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

"Setting for lightline"
let g:lightline = {
      \ 'colorscheme': 'hybrid',
      \ 'active': {
      \   'left': [ 
      \       [ 'mode', 'paste' ], 
      \       [ 'pyenv'],
      \       [ 'fugitive', 'filename' ] 
      \   ]
      \ }
      \}

if !has('win32')
  colorscheme hybrid
endif


set whichwrap=b,s,h,l,<,>,[,]
