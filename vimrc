" Vundle stuff
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'

syntax on
filetype plugin on

" Fix tmux clipboard
if $TMUX == ''
    set clipboard+=unnamed
endif

set encoding=utf-8
set showcmd
set relativenumber
set undofile

" Show dots on trailing whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Whitespace
set nowrap
set textwidth=79
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set shiftround
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
let g:solarized_visibility = "medium"
let g:solarized_contrast = "medium"
colorscheme solarized

set guifont=Inconsolata\ For\ Powerline:h16

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1

" Folding
set foldmethod=indent
set foldlevel=99

" Maps space to folds
nnoremap <Space> za
vnoremap <Space> za
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Maps leaderspace to nohlsearch
nnoremap <leader><space> :noh<cr>
" Maps tab to matching parenthesis/brackets etc
nnoremap <tab> %
vnoremap <tab> %

" Reloads vimrc automatically
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | endif
augroup END
