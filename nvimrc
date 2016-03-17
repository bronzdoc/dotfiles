set nobomb

" Make vim faster on terminal
set lazyredraw
set ttyfast

" set the runtime path to include Vundle and initialize
set rtp+=~/.neovim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
call vundle#begin('~/.neovim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Highlight trailing whitespace
Plugin 'bronson/vim-trailing-whitespace'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Easy way to search for files
Plugin 'ctrlpvim/ctrlp.vim'

" Nice buffers in status line
Plugin 'bling/vim-bufferline'

" This allow me to see m-key marks
Plugin 'kshenoy/vim-signature'

" vim gist plugin
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Use git from vim
Plugin 'tpope/vim-fugitive'

" Adds filetype glyphs (icons)
Plugin 'ryanoasis/vim-devicons'

" GO vim support
Plugin 'fatih/vim-go'

" Puppet syntax
Plugin 'rodjek/vim-puppet'

" javascript syntax
Plugin 'jelera/vim-javascript-syntax'

" coffeescript eww
Plugin 'kchmck/vim-coffee-script'

" Write html with ease
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'rhysd/vim-crystal'

" Color schemes
Plugin 'bronzdoc/samurai'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'joshdick/onedark.vim'
Plugin 'w0ng/vim-hybrid'
" Bazillion of colorschemes, sweet!
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()

" Standar setup
filetype plugin indent on " required

set laststatus=2
"set noshowmode

let g:bufferline_echo = 0
autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()

let g:bufferline_show_bufnr = 0
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'

" Unmap the arrow keys(normal mode)
noremap <down> <nop>
noremap <up> <nop>


" Unmap the arrow keys(insert mode)
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

"" Show indentation levels

" Use spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
set noexpandtab
set expandtab
set autoindent
set smartindent
set smarttab
set list listchars=tab:››,eol:¬

" Annoyances
set noerrorbells
set relativenumber
set number
set ruler
set nobackup
set noswapfile
set autochdir
set nowrap

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

" INSERT mode mapping

" move faster, dont go to esc, just pres jk fast to return to normal
inoremap jk <esc>

" Forced to use 'jk' to enter normal mode
inoremap <esc> <nop>

"" NORMAL mode mapping

" Source vimrc
nnoremap <leader>sv :source $MYNVIMRC<cr>

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
nnoremap H <C-w>w
nnoremap L <C-w>W
nnoremap <leader>rm <esc>:%s/\r//g<cr><esc>

" Uppercase word
nnoremap <leader><c-u> viwg<s-u>

" Indent with a keystroke
nnoremap <leader>g ggv<s-g>=

" Wrap word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Open vimrc in a new tab
nnoremap <leader>ev :vsplit $MYNVIMRC<cr><c-w>

" Display name of the current file
nnoremap <leader>fp :echo expand('%:p')<cr>

" Select word with space tab
nnoremap <space> viw

" Go to the start of the line with 'H'
nnoremap <s-h> <s-^>

" Go to the end of the line with 'L'
nnoremap <s-l> <s-$>

"" VISUAL mode mapping

" Wrap word in single quotes
vnoremap <leader>' <esc>a'<esc>v:<cr>i'<esc>
vnoremap n <esc>

" vim abbreviations
iabbrev @@ <cr>Author:Luis Sagastume<cr>Email:lsagastume1990@gmail.com

" This will elimiate all the whitespace when a file is written
autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e

" echo syntax groups
map <leader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set cindent
set foldmethod=indent
set foldclose=all

" ctags config
set tags=./tags,tags;$HOME

" Set colorscheme
syntax enable
set background=dark
colorscheme samurai
