colorscheme elflord
set shiftwidth=2
set tabstop=2
set expandtab
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set nu
set autoindent


imap <C-l> <del>

"TagList.vim
"sudo apt-get install exuberant-ctags
set tags=tags
"let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File = 1             " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1          " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1           " taglistのウインドウだけならVimを閉じる
let Tlist_WinWidth = 50
map <silent> <leader>l :TlistToggle<CR> " \lでtaglistウインドウを開いたり閉じたり出来るショートカット
