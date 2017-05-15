"===========================================================================
" Vim個人用設定
" 

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" 行番号の表示
" 参考: http://blog.livedoor.jp/spyder_5615/archives/26386690.html
:set number

"---------------------------------------------------------------------------
" ファイル編集に関する設定:
"
" 日本語設定
" エンコードの設定(ファイルを開くエンコード)
:set encoding=utf-8
" ファイルエンコードの設定(入力形式)
:set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
" ファイルフォーマットの設定(改行形式)
:set fileformats=unix,dos,mac

" 折り畳みマーカーを設定する
" 折り畳みマーカーをコメントでつける <ヴィジュアルモードで選択範囲を fz >
" 参考: http://nanasi.jp/articles/howto/fold/fold-marker.html
:set foldmethod=marker

" markdown
" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" インクルードディレクトリを設定
" , 区切りで複数のディレクトリを設定する事ができる
setlocal path+=C:/mingw/lib/gcc/mingw32/4.4.0/include/c++,C:/Qt/4.7.0/include

" 標準ライブラリを開いた時に C++ と認識させる
" 標準ライブラリへのパスを設定
let $CPP_STDLIB = "C:/mingw/lib/gcc/mingw32/4.6.2/include/c++"

augroup vimrc-set_filetype_cpp
    autocmd!
    " $CPP_STDLIB よりも下の階層のファイルが開かれて
    " filetype が設定されていない場合に filetype=cpp を設定する
    autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END

"---------------------------------------------------------------------------
" 自動生成ファイルに関する設定:
"
" スワップファイルを作成しない
" 参考: http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html
:set noswapfile
" バックアップファイルを作成しない
" 参考: http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html
:set nobackup
" アンドゥファイルを作成しない
" 参考: http://www.kaoriya.net/blog/2014/03/30/
:set noundofile

"---------------------------------------------------------------------------
" コマンドに関する設定:
"
" tabnew
command Tn tabnew

"--------------------------------------------------------------------------- 
" タブに関する設定:
"
" 半角スペース4文字に設定
"set noexpandtab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=0

"---------------------------------------------------------------------------
" NeoBundleを設定:
"
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" 以下を追記
set nocompatible
" ファイルタイプ用のインデント設定を自動読み込みしないようになる。
filetype plugin indent off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif 

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" 初期化関数
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'

" neocomplete.vim
" 汎用的な補完を行う
NeoBundle 'Shougo/neocomplete.vim'
" 補完を有効にする
let g:neocomplete#enable_at_startup = 1
" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""

" neosnippet.vim
NeoBundle 'Shougo/neosnippet.vim'

" surround.vim
NeoBundle 'tpope/vim-surround'

" Emmet-vim
NeoBundle 'mattn/emmet-vim'
" lang="ja" にする
let g:user_emmet_settings = { 
\ 'variables': { 
\ 'lang' : 'ja' 
\ } 
\} 

" open-browser.vim
NeoBundle 'tyru/open-browser.vim'
command! OpenBrowserCurrent execute "OpenBrowser" expand("%:p")

" vim-quickrun
NeoBundle 'thinca/vim-quickrun'
"let g:quickrun_config['html'] = { 'command' : 'open', 'exec' : '%c %s', 'outputter': 'browser' }
"let g:quickrun_config = { "html" : { 'exec' : 'start cmd /c %s', 'output': '!', 'shellcmd': '!%s' } }
let g:quickrun_config = { "html" : { 'command' : 'open', 'exec' : 'start cmd /c %s', 'outputter': 'browser' } }

" clever-f.vim
NeoBundle 'rhysd/clever-f.vim'

" a.vim
NeoBundle 'vim-scripts/a.vim'

" DoxygenToolkit.vim
NeoBundle 'mrtazz/DoxygenToolkit.vim'

" commentout.vim
" コメントアウトプラグイン
NeoBundle 'sakuraiyuta/commentout.vim' 

" maketable.vim
" マークダウン風テーブル作成プラグイン
NeoBundle 'mattn/vim-maketable'

" vimfiler.vim
" shell
NeoBundle 'Shougo/vimshell.vim'

" vimfiler.vim
" ファイルエクスプローラ
NeoBundle 'Shougo/vimfiler.vim'

NeoBundle "scrooloose/syntastic"

"jedi を入れるとpythonファイル読み込み時に落ちるので一旦切る
"NeoBundle 'davidhalter/jedi-vim'

" End of NeoBundle
call neobundle#end()

" .vimrc 最後の辺りに書く
" ファイルタイプ関連を有効にする
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""---------------------------------------------------------------------------
"" jedi settings:
"" 
"autocmd FileType python setlocal omnifunc=jedi#completions
"
"let g:jedi#auto_vim_configuration = 0
"
"if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"endif
"
"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"
"" docstringは表示しない
"autocmd FileType python setlocal completeopt-=preview
"---------------------------------------------------------------------------
" syntastic settings:
" 
" 使用するには、PATHを通しておく
let g:syntastic_cpp_checkers = ["cppcheck"]
" 使用するには、pip install しておく
let g:syntastic_python_checkers = ["flake8", "mypy"]

