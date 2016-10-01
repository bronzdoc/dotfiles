set nobomb
set t_Co=256

" Make vim faster on terminal
set lazyredraw
set ttyfast

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Highlight trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

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
Plug 'fatih/vim-go'

" Write html with ease
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" Crystal
Plug 'rhysd/vim-crystal'

" Rust
Plug 'rust-lang/rust.vim'

" ligthline
Plug 'itchyny/lightline.vim'

" Colorschemes
Plug 'bronzdoc/samurai'
Plug 'noahfrederick/vim-hemisu'
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Add plugins to &runtimepath
call plug#end()

" Standar setup
filetype plugin indent on " required

set laststatus=2
set noshowmode

let g:lightline = {
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

" Unmap the arrow keys(normal mode)
noremap <down> <nop>
noremap <up> <nop>

" Unmap the arrow keys(insert mode)
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"
"" Show indentation levels

" Use spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4
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

" Remember the line i was on
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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

" This will elimiate all the whitespace when a file is written
aug filetype
    au!
    au FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e
    au FileType ruby,crystal setlocal tabstop=2 softtabstop=2 shiftwidth=2
aug end

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
"

" echo syntax groups
map <leader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set cindent

" ctags config
set tags=./tags,tags;$HOME

set showbreak=↪

" Set colorscheme
syntax enable
set background=dark
colorscheme samurai
