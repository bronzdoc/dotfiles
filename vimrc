set nobomb
set t_Co=256

" Make vim faster on terminal
set lazyredraw
set ttyfast

call plug#begin('~/.vim/plugged')


" vim plugins -- {{{
"
" Highlight trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" vim file tree
Plug 'scrooloose/nerdtree'


" Easy way to search for files
Plug 'ctrlpvim/ctrlp.vim'

" Nice buffers in status line
Plug 'bling/vim-bufferline'

" vim gist plugin
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Use git from vim
Plug 'tpope/vim-fugitive'

" Surround text object
Plug 'tpope/vim-surround'

" Adds filetype glyphs (icons)
Plug 'ryanoasis/vim-devicons'

" GO vim support
Plug 'fatih/vim-go', {'for': 'go'}

" Write html with ease
Plug 'rstacruz/sparkup', {'rtp': 'vim/', 'for': 'html'}

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Multiple language support
Plug 'sheerun/vim-polyglot'

" lightline
Plug 'itchyny/lightline.vim'

" Colorschemes
Plug 'bronzdoc/samurai'
Plug 'bronzdoc/zombie'
Plug 'noahfrederick/vim-hemisu'
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
"}}}

" Add plugins to &runtimepath
call plug#end()

" Standar setup
filetype plugin indent on " required

set laststatus=2
set noshowmode

" lightline --{{{
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'n': 'N','i': 'I','R': 'R','v': 'V',},
      \ 'active': {
      \   'left': [['mode','paste'],['fugitive','readonly','filename','modified']]},
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': ' %{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '¦', 'right': '¦' }
      \ }

let s:cuicolor = {
      \ 'black'          : 16,
      \ 'white'          : 231,
      \
      \ 'darkestgreen'   : 22,
      \ 'darkgreen'      : 28,
      \ 'mediumgreen'    : 70,
      \ 'brightgreen'    : 148,
      \
      \ 'darkestcyan'    : 23,
      \ 'mediumcyan'     : 117,
      \
      \ 'darkestblue'    : 24,
      \ 'darkblue'       : 31,
      \
      \ 'darkestred'     : 52,
      \ 'darkred'        : 88,
      \ 'mediumred'      : 124,
      \ 'brightred'      : 160,
      \ 'brightestred'   : 196,
      \
      \ 'darkestpurple'  : 55,
      \ 'mediumpurple'   : 98,
      \ 'brightpurple'   : 189,
      \
      \ 'brightorange'   : 208,
      \ 'brightestorange': 214,
      \
      \ 'gray0'          : 233,
      \ 'gray1'          : 235,
      \ 'gray2'          : 236,
      \ 'gray3'          : 239,
      \ 'gray4'          : 240,
      \ 'gray5'          : 241,
      \ 'gray6'          : 244,
      \ 'gray7'          : 245,
      \ 'gray8'          : 247,
      \ 'gray9'          : 250,
      \ 'gray10'         : 252,
      \
      \ 'yellow'         : 136,
      \ 'orange'         : 166,
      \ 'red'            : 160,
      \ 'magenta'        : 125,
      \ 'violet'         : 61,
      \ 'blue'           : 33,
      \ 'cyan'           : 37,
      \ 'green'          : 64,
      \ }

let s:guicolor = {
      \ 'black'          : '#000000',
      \ 'white'          : '#ffffff',
      \
      \ 'darkestgreen'   : '#005f00',
      \ 'darkgreen'      : '#008700',
      \ 'mediumgreen'    : '#5faf00',
      \ 'brightgreen'    : '#afdf00',
      \
      \ 'darkestcyan'    : '#005f5f',
      \ 'mediumcyan'     : '#87dfff',
      \
      \ 'darkestblue'    : '#005f87',
      \ 'darkblue'       : '#0087af',
      \
      \ 'darkestred'     : '#5f0000',
      \ 'darkred'        : '#870000',
      \ 'mediumred'      : '#af0000',
      \ 'brightred'      : '#df0000',
      \ 'brightestred'   : '#ff0000',
      \
      \ 'darkestpurple'  : '#5f00af',
      \ 'mediumpurple'   : '#875fdf',
      \ 'brightpurple'   : '#dfdfff',
      \
      \ 'brightorange'   : '#ff8700',
      \ 'brightestorange': '#ffaf00',
      \
      \ 'gray0'          : '#121212',
      \ 'gray1'          : '#262626',
      \ 'gray2'          : '#303030',
      \ 'gray3'          : '#4e4e4e',
      \ 'gray4'          : '#585858',
      \ 'gray5'          : '#606060',
      \ 'gray6'          : '#808080',
      \ 'gray7'          : '#8a8a8a',
      \ 'gray8'          : '#9e9e9e',
      \ 'gray9'          : '#bcbcbc',
      \ 'gray10'         : '#d0d0d0',
      \
      \ 'yellow'         : '#b58900',
      \ 'orange'         : '#cb4b16',
      \ 'red'            : '#dc322f',
      \ 'magenta'        : '#d33682',
      \ 'violet'         : '#6c71c4',
      \ 'blue'           : '#268bd2',
      \ 'cyan'           : '#2aa198',
      \ 'green'          : '#859900',
      \ }


let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette

let s:palette.normal.left = [ [ s:guicolor.darkestgreen, s:guicolor.brightgreen, s:cuicolor.darkestgreen, s:cuicolor.brightgreen ], [ s:guicolor.gray4, s:guicolor.gray1, s:cuicolor.gray4, s:cuicolor.gray1 ] ]

let s:palette.visual.left = [ [ s:guicolor.darkred, s:guicolor.brightorange, s:cuicolor.darkred, s:cuicolor.brightorange], [s:guicolor.gray4, s:guicolor.gray1, s:cuicolor.gray4, s:cuicolor.gray1]]
"}}}

" Unmap the arrow keys(normal mode)
noremap <down> <nop>
noremap <up> <nop>

" Unmap the arrow keys(insert mode)
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Use spaces for tabs
set tabstop=2 softtabstop=2 shiftwidth=2
set noexpandtab
set expandtab
set autoindent
set smartindent
set smarttab
set list listchars=tab:››,eol:¬

" Annoyances
set noerrorbells
set relativenumber
set numberwidth=1
set number
set ruler
set nobackup
set noswapfile
set autochdir
set wrap

" Sane searching and search highlights
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
noremap - :nohls<CR>

" Highlight line and column
set cursorline cursorcolumn

"set leaders
let mapleader = ";"
let maplocalleader = "\\"

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Show line, shows color column
nnoremap<leader>sl :set textwidth=80<cr>:set cc=+1<cr>
" Close line, closes color column
nnoremap<leader>cl <esc>:set cc=<cr>

" Move between buffers and panes
nnoremap <up> <C-W>k
nnoremap <down> <C-W>j
nnoremap <S-Left> <C-W>h
nnoremap <S-Right> <C-W>l
nnoremap <left> :bp!<CR>
nnoremap <right> :bn!<CR>
nnoremap <leader>rm <esc>:%s/\r//g<cr><esc>

" Uppercase word
nnoremap <leader><c-u> viwg<s-u>

" Indent with a keystroke
nnoremap <leader>g ggv<s-g>=

" Wrap word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Open vimrc in a new window
nnoremap <leader>ev :vsplit $MYVIMRC<cr><c-w>
" Display name of the current file
nnoremap <leader>fp :echo expand('%:p')<cr>

" Select word with space tab
nnoremap <space> viw

" Move within tabs
nnoremap <leader>t gt
nnoremap <leader>y gT

" Wrap word in single quotes
vnoremap <leader>' <esc>a'<esc>v:<cr>i'<esc>
vnoremap n <esc>

" vim abbreviations
iabbrev @@ <cr>Author:Luis Sagastume<cr>Email:lsagastume1990@gmail.com

" augroups --{{{
aug filetype
  au!

  " This will elimiate all the whitespace when a file is written
  au FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e

  au FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4
  au FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4
aug end

aug util
  if has("autocmd")
    au!
    " Remember the line i was on
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    au FileType vim setlocal foldmethod=marker
  endif
aug end
"}}}

" echo syntax groups
map <leader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set cindent

" ctags config
set tags=./tags,tags;$HOME

set showbreak=↪

" Setup true colors if available
if has("termguicolors")
  set termguicolors
endif

" Set colorscheme
syntax enable
set background=dark
colorscheme zombie
