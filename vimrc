set nobomb
set t_Co=256

" Make vim faster on terminal
set lazyredraw
set ttyfast

call plug#begin('~/.vim/plugged')

" vim plugins -- {{{

" Highlight trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Powerful fuzzyfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Focus on specific part of your code
Plug 'junegunn/limelight.vim'

" vim file tree
Plug 'scrooloose/nerdtree'

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

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" lightline
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'bronzdoc/blackMamba'
Plug 'danishprakash/vim-yami'

" Colorschemes
Plug 'bronzdoc/samurai'
Plug 'bronzdoc/zombie'
Plug 'sjl/badwolf'
Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'ghifarit53/tokyonight-vim'

"}}}


" Optional deps
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'stevearc/dressing.nvim' " for enhanced input UI
Plug 'folke/snacks.nvim' " for modern input UI


call plug#end()

" Add plugins to &runtimepath
call plug#end()

" Standar setup
filetype plugin indent on " required

set laststatus=2
set noshowmode

" lightline --{{{
let g:lightline = {
      \ 'colorscheme': 'black_mamba',
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
set list listchars=tab:..,eol:¬
set backspace=indent,eol,start

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

" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :ProjectFiles<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" .............................................................................
" scrooloose/nerdtree
" .............................................................................

" Toggle NERDTree
nnoremap <C-o> :NERDTreeToggle<CR>

" Make NERDTree show hidden files
let NERDTreeShowHidden=1

" Close NERDTree when opening a file
let g:NERDTreeQuitOnOpen=1

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

set showbreak=↪

" Setup true colors if available
if has("termguicolors")
  set termguicolors
endif

" Set colorscheme
syntax enable
set background=dark

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
