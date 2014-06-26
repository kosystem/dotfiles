colorscheme elflord
set shiftwidth=2
set tabstop=2
set expandtab
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set nu
set autoindent
set laststatus=2
set t_Co=256

imap <C-l> <del>

nnoremap x "_x
nnoremap q <C-w>

"TagList.vim
"sudo apt-get install exuberant-ctags
set tags=tags
"let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File = 1             " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1          " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1           " taglistのウインドウだけならVimを閉じる
let Tlist_WinWidth = 50
map <silent> <leader>l :TlistToggle<CR> " \lでtaglistウインドウを開いたり閉じたり出来るショートカット


"NeoBundle"
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
"Color scheme
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'cocopon/lightline-hybrid.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"Setting for QuickRun"
let g:quickrun_config = {
      \  '_': {
      \    'hook/time/enable': '1',
      \    'outputter/buffer/split': ':botright 10sp'
      \  },
      \}

"Setting for lightline"
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \}

colorscheme hybrid
