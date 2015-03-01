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
" 折り畳みマーカーを設定する
" 折り畳みマーカーをコメントでつける <ヴィジュアルモードで選択範囲を fz >
" 参考: http://nanasi.jp/articles/howto/fold/fold-marker.html
:set foldmethod=marker

" markdown
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

" 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
" neocomplete.vim
" 汎用的な補完を行う
NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'Shougo/neosnippet.vim'


" 補完を有効にする
let g:neocomplete#enable_at_startup = 1

" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""

" End of NeoBundle
call neobundle#end()

" .vimrc 最後の辺りに書く
" ファイルタイプ関連を有効にする
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------------------------------------------------------------------------- 
" タブに関する設定:
"
" plugin
source ~/.vim/plugin/a.vim
source ~/.vim/plugin/DoxygenToolkit.vim

"---------------------------------------------------------------------------
" キーマッピング(エイリアス):
"nnoremap  <UP> <C-w>k
"nnoremap  <DOWN> <C-w>j
"nnoremap  <Right> <C-w>l
"nnoremap  <Left> <C-w>h

