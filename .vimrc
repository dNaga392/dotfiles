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
" �܂��݃}�[�J�[��ݒ肷��
" �܂��݃}�[�J�[���R�����g�ł��� <���B�W���A�����[�h�őI��͈͂� fz >
" �Q�l: http://nanasi.jp/articles/howto/fold/fold-marker.html
:set foldmethod=marker

" markdown
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

" �ȉ��͕K�v�ɉ����Ēǉ�
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
" neocomplete.vim
" �ėp�I�ȕ⊮���s��
NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'Shougo/neosnippet.vim'


" �⊮��L���ɂ���
let g:neocomplete#enable_at_startup = 1

" �⊮�Ɏ��Ԃ��������Ă��X�L�b�v���Ȃ�
let g:neocomplete#skip_auto_completion_time = ""

" End of NeoBundle
call neobundle#end()

" .vimrc �Ō�̕ӂ�ɏ���
" �t�@�C���^�C�v�֘A��L���ɂ���
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------------------------------------------------------------------------- 
" �^�u�Ɋւ���ݒ�:
"
" plugin
source ~/.vim/plugin/a.vim
source ~/.vim/plugin/DoxygenToolkit.vim

"---------------------------------------------------------------------------
" �L�[�}�b�s���O(�G�C���A�X):
"nnoremap  <UP> <C-w>k
"nnoremap  <DOWN> <C-w>j
"nnoremap  <Right> <C-w>l
"nnoremap  <Left> <C-w>h

