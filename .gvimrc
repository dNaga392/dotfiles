"===========================================================================
" gVim個人用設定

"---------------------------------------------------------------------------
" カラー設定:
colorscheme evening

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" 半透明にする
" http://c4se.hatenablog.com/entry/2013/05/04/093446 
autocmd GUIEnter * set transparency=220

" フォーカスで透過を変更する
"autocmd FocusGained * set transparency=220
"autocmd FocusLost * set transparency=128

" textwidthでフォーマットさせない(自動改行させない)
" http://blog.livedoor.jp/haruka_sao/archives/52059445.html
set formatoptions=q
