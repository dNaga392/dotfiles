"===========================================================================
" Vim�l�p�ݒ�
" 

"---------------------------------------------------------------------------
" �E�C���h�E�Ɋւ���ݒ�:
"
" �s�ԍ��̕\��
" �Q�l: http://blog.livedoor.jp/spyder_5615/archives/26386690.html
:set number

"---------------------------------------------------------------------------
" �t�@�C���ҏW�Ɋւ���ݒ�:
"
" ���{��ݒ�
" �G���R�[�h�̐ݒ�(�t�@�C�����J���G���R�[�h)
":set encoding=sjis
" �t�@�C���G���R�[�h�̐ݒ�(���͌`��)
":set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" �t�@�C���t�H�[�}�b�g�̐ݒ�(���s�`��)
":set fileformat=dos

" �܂��݃}�[�J�[��ݒ肷��
" �܂��݃}�[�J�[���R�����g�ł��� <���B�W���A�����[�h�őI��͈͂� fz >
" �Q�l: http://nanasi.jp/articles/howto/fold/fold-marker.html
:set foldmethod=marker

" markdown
" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" �C���N���[�h�f�B���N�g����ݒ�
" , ��؂�ŕ����̃f�B���N�g����ݒ肷�鎖���ł���
setlocal path+=C:/mingw/lib/gcc/mingw32/4.4.0/include/c++,C:/Qt/4.7.0/include

" �W�����C�u�������J�������� C++ �ƔF��������
" �W�����C�u�����ւ̃p�X��ݒ�
let $CPP_STDLIB = "C:/mingw/lib/gcc/mingw32/4.6.2/include/c++"

augroup vimrc-set_filetype_cpp
    autocmd!
    " $CPP_STDLIB �������̊K�w�̃t�@�C�����J�����
    " filetype ���ݒ肳��Ă��Ȃ��ꍇ�� filetype=cpp ��ݒ肷��
    autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END

"---------------------------------------------------------------------------
" ���������t�@�C���Ɋւ���ݒ�:
"
" �X���b�v�t�@�C�����쐬���Ȃ�
" �Q�l: http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html
:set noswapfile
" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ�
" �Q�l: http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html
:set nobackup
" �A���h�D�t�@�C�����쐬���Ȃ�
" �Q�l: http://www.kaoriya.net/blog/2014/03/30/
:set noundofile

"---------------------------------------------------------------------------
" �R�}���h�Ɋւ���ݒ�:
"
" tabnew
command Tn tabnew

"--------------------------------------------------------------------------- 
" �^�u�Ɋւ���ݒ�:
"
" ���p�X�y�[�X4�����ɐݒ�
"set noexpandtab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=0

"---------------------------------------------------------------------------
" NeoBundle��ݒ�:
"
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" �ȉ���ǋL
set nocompatible
" �t�@�C���^�C�v�p�̃C���f���g�ݒ�������ǂݍ��݂��Ȃ��悤�ɂȂ�B
filetype plugin indent off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif 

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" �������֐�
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'

" neocomplete.vim
" �ėp�I�ȕ⊮���s��
NeoBundle 'Shougo/neocomplete.vim'
" �⊮��L���ɂ���
let g:neocomplete#enable_at_startup = 1
" �⊮�Ɏ��Ԃ��������Ă��X�L�b�v���Ȃ�
let g:neocomplete#skip_auto_completion_time = ""

" neosnippet.vim
NeoBundle 'Shougo/neosnippet.vim'

" surround.vim
NeoBundle 'tpope/vim-surround'

" Emmet-vim
NeoBundle 'mattn/emmet-vim'
" lang="ja" �ɂ���
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
" �R�����g�A�E�g�v���O�C��
NeoBundle 'sakuraiyuta/commentout.vim' 

" maketable.vim
" �}�[�N�_�E�����e�[�u���쐬�v���O�C��
NeoBundle 'mattn/vim-maketable'

" End of NeoBundle
call neobundle#end()

" .vimrc �Ō�̕ӂ�ɏ���
" �t�@�C���^�C�v�֘A��L���ɂ���
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"---------------------------------------------------------------------------
" �L�[�}�b�s���O(�G�C���A�X):
"nnoremap  <UP> <C-w>k
"nnoremap  <DOWN> <C-w>j
"nnoremap  <Right> <C-w>l
"nnoremap  <Left> <C-w>h

