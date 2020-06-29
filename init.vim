set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake'
Plug 'scrooloose/nerdTree'
Plug 'scrooloose/nerdcommenter'
Plug 'derekwyatt/vim-fswitch'
Plug 'Lokaltog/vim-powerline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

Plug 'ntpeters/vim-better-whitespace'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
call plug#end()

set timeoutlen=500 ttimeoutlen=0
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let python_highlith_all=1
set clipboard+=unnamedplus
let mapleader=";" " set <leader> key

filetype on
filetype plugin on

"autocmd BufWritePost $MYVIMRC source $MYVIMRC  " load vimrc whenever it changed
set t_Co=256    "support terminal color
set number
set incsearch   "increment search
set ignorecase
set wildmenu
set laststatus=2  "always show status bar
set ruler	  " always show line/column number
set cursorline
set cursorcolumn
set hlsearch
set nowrap
set tags=./tags,tags;$HOME

syntax enable
syntax on

filetype indent on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoread
set guifont=Monospace:h9
set mouse=a
"
"FSwitch {
    " header/source switches
    let g:fsnonewfiles = 'on'
    autocmd BufEnter *.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs =  '.,..,include,../include'
    autocmd BufEnter *.cc let b:fswitchdst = 'h,hpp' | let b:fswitchlocs =   '.,..,include,../include'
    autocmd BufEnter *.c let b:fswitchdst = 'h,hpp' | let b:fswitchlocs =    '.,..,include,../include'
    autocmd BufEnter *.h let b:fswitchdst = 'cpp,c,cc' | let b:fswitchlocs = '.,..,impl,../impl,src,../src'
"

" color schema
colorscheme gruvbox

" NerdTree {
if !exists('g:GtkGuiLoaded')
    autocmd VimEnter * NERDTree
    let NERDTreeWinPos="left"
    let NERDTreeIgnore=['\.pyc']
endif
" }
"
" powerline {
	let g:Powerline_colorscheme='solarized256'
" }

" indent guid line {
	let g:indent_guides_enable_on_vim_startup=1
	" 从第二层开始可视化显示缩进
	let g:indent_guides_start_level=2
	" " 色块宽度
	let g:indent_guides_guide_size=0
	" " 快捷键 i 开/关缩进可视化
	:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" }
"
"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\.o'

" language service client setup
set hidden
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ 'c': ['clangd'],
    \ 'c++': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'cc': ['clangd'],
    \ 'rs': ['rls'],
    \ 'rust': ['rls'],
    \ 'php': ['php', '~/dev_env/vendor/felixfbecker/language-server/bin/php-language-server.php'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" use deoplete
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" betterspace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0



" neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
