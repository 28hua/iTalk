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
"搜索高亮
set hlsearch
"折行
set wrap
set cursorline
"case insensitive
set ignorecase
set updatetime=2000

set cmdheight=2

set awa

set grepprg=ag


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

let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '/home/xiexy/.config/ycm/.ycm_extra_conf.py'
set completeopt=menu,menuone
let g:ycm_key_invoke_completion = '<C-.>'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_goto_buffer_command = 'split'
let g:ycm_python_binary_path = 'python'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_semantic_triggers = {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

nnoremap <leader>jt :YcmCompleter GoTo
nnoremap <leader>gt :YcmCompleter Get

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rdnetto/YCM-Generator'
"./config_gen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rhysd/vim-clang-format'
let g:clang_format#style_options = {
            \   "ColumnLimit": 80,
            \   "AccessModifierOffset": -4}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'w0rp/ale'
"let g:ale_linters_explicit = 1
"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 500
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 1
"let g:airline#extensions#ale#enabled = 1
"
"let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
"
"let g:ale_sign_error = "\ue009\ue009"
"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = '/usr/bin/ag'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/LeaderF'
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutB = '<A-B>'
noremap <C-N> :LeaderfMru<cr>
noremap <S-F> :LeaderfFunction!<cr>
noremap <S-B> :LeaderfBuffer<cr>
noremap <C-M> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
nmap <Leader>f :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'majutsushi/tagbar'
nmap <Leader>t :Tagbar<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/closetag.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Raimondi/delimitMate'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'octol/vim-cpp-enhanced-highlight'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'muziqiushan/vim-bufonly'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-signify'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug '28hua/dict.vim'
let g:api_key = "1932136763"
let g:keyfrom = "aioiyuuko"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/fcitx.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'kien/ctrlp.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/lua.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/vim-misc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ds26gte/scmindent'
if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif
autocmd filetype lisp,scheme setlocal equalprg=scmindent.rkt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'luochen1990/rainbow'
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent		" always set autoindenting on
set smartindent
set cindent

if has('gui_running')
    "字体
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
    set linespace=-2
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
set foldmethod=syntax
set foldlevel=99
autocmd filetype python set foldmethod=indent

set so=8

"始终显示状态条
set laststatus=2


"不高亮匹配
let loaded_matchparen = 1

"tab1~10
nmap <leader>0 :tabn10<cr>
nmap <leader>1 :tabn1<cr>
nmap <leader>2 :tabn2<cr>
nmap <leader>3 :tabn3<cr>
nmap <leader>4 :tabn4<cr>
nmap <leader>5 :tabn5<cr>
nmap <leader>6 :tabn6<cr>
nmap <leader>7 :tabn7<cr>
nmap <leader>8 :tabn8<cr>
nmap <leader>9 :tabn9<cr>
nmap <leader>c :tabclose<cr>

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
    colorscheme molokai
endif


"刷新vimrc
nmap <leader>e :e! ~/.vimrc<cr>
"autocmd! bufwritepost vimrc source ~/.vimrc

"clear search hight light
nmap <BS> :nohl<CR>

"scrolling in insert mode
imap <C-E> <C-X><C-E>
imap <C-Y> <C-X><C->

"快速移动到其他window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l 

"ctags
set tags=./.tags;,.tags


"插入模式下bash风格移动
imap <C-F> <Right>
imap <C-B> <Left>
imap <C-A> <Esc><S-i>
imap <C-E> <End>
"删除
imap <C-D>  <Delete>

imap <c-j> <c-g><c-j>
imap <c-k> <c-g><c-k>

"emacs-stype editing on the command-line
" start of line
:cnoremap <C-A>		<Home>
" back one character
:cnoremap <C-B>		<Left>
" delete character under cursor
:cnoremap <C-D>		<Del>
" end of line
:cnoremap <C-E>		<End>
" forward one character
:cnoremap <C-F>		<Right>
" recall newer command-line
:cnoremap <C-N>		<Down>
" recall previous (older) command-line
:cnoremap <C-P>		<Up>
" back one word
:cnoremap <Esc><C-B>	<S-Left>
" forward one word
:cnoremap <Esc><C-F>	<S-Right>



"更改备份和交换文件的位置
set backupdir=~/.vimtmp
set directory=~/.vimtmp
set undodir=~/.vimtmp

nmap j gj
nmap k gk

