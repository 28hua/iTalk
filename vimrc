" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif

set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

execute pathogen#infect()
syntax on
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'ds26gte/scmindent'
Plugin 'luochen1990/rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'closetag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'fcitx.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin '28hua/dict.vim'
"Plugin 'Valloric/YouCompleteMe'
"" Track the engine.
"Plugin 'SirVer/ultisnips'
"" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
"
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

set autoindent		" always set autoindenting on
set smartindent
set cindent

if has('gui_running')
    "字体
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 13
    set linespace=0
    "隐藏工具栏和菜单栏和滚动条
    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b
endif

"tab设置为4个空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"折叠
"set foldcolumn=1
set foldmethod=indent
set foldlevel=0

"始终显示状态条
set laststatus=2
"vim-airline配置
let g:airline#extensions#tabline#enabled = 1


"改leader键为"空格"
let mapleader="\<Space>"


"tab1~10
nmap <leader><tab>0 :tabn10<cr>
nmap <leader><tab>1 :tabn1<cr>
nmap <leader><tab>2 :tabn2<cr>
nmap <leader><tab>3 :tabn3<cr>
nmap <leader><tab>4 :tabn4<cr>
nmap <leader><tab>5 :tabn5<cr>
nmap <leader><tab>6 :tabn6<cr>
nmap <leader><tab>7 :tabn7<cr>
nmap <leader><tab>8 :tabn8<cr>
nmap <leader><tab>9 :tabn9<cr>

nmap <leader><tab>t :tabnew<cr>
nmap <leader><tab>c :tabclose<cr>


"拿buffer当普通编辑器的tab使
nmap<S-h> :bp<CR>
nmap<S-l> :bn<CR>

"行号和相对行号
set relativenumber
set number

"主题配色
syntax enable
if has('gui_running')
    set background=dark
    colorscheme molokai
else
    set background=light
    colorscheme desert
endif


"复制粘贴
nmap <Leader>p "+p
vmap <Leader>y "+y
vmap <Leader>x "+x
vmap <Leader>d "+d

"两文件切换
nmap <Leader><Tab> <C-^>

"tagbar快捷键
nmap <Leader>t :TagbarToggle<CR>

"NERDTree快捷键
nmap <Leader>f :NERDTreeToggle<CR>

"刷新vimrc
nmap <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc

"快速移动到其他window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l 

"dict.vim
let g:api_key = "1932136763"
let g:keyfrom = "aioiyuuko"

"vim-easy-align
"Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"ultisnips
"let g:UltiSnipsExpandTrigger="<c-k>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-p>"
"let g:UltiSnipsJumpBackwardTrigger="<c-n>"

"jedi-vim

"Youcompleteme
"let g:ycm_global_ycm_extra_conf = '/home/yangzai/.config/ycm/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_key_invoke_completion = '<C-.>'
"let g:ycm_python_binary_path = 'python'
"
"nnoremap <leader>gt :YcmCompleter GoTo<CR>
"nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
"nnoremap <leader>gc :YcmCompleter GetDoc<CR>


"ctags
set tags=./.tags;,.tags


"插入模式下bash风格移动
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-a> <Home>
imap <C-e> <End>
"和删除
imap <C-d>  <Delete>


"ctrlp
let g:ctrlp_cmd='CtrlP'

"scmindent
if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif
autocmd filetype lisp,scheme setlocal equalprg=scmindent.rkt

"rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}


"更改备份和交换文件的位置
set backupdir=~/.vimtmp
set directory=~/.vimtmp
set undodir=~/.vimtmp

nmap j gj
nmap k gk


"折行
set wrap
"搜索高亮
set hlsearch
"case insensitive
set ignorecase
