" Basic
filetype plugin indent on
set autoindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set encoding=utf8
set hlsearch ignorecase incsearch smartcase
set laststatus=0 ruler rulerformat=%50(%=%<%F%m\ ›\ %{getfsize(@%)}B\ \›\ %l/%L:%v%)
set lazyredraw nocursorline ttyfast
set listchars=eol:¶,trail:•,tab:▸\  showbreak=¬\
set mouse=a
set nobackup noswapfile nowritebackup undofile undodir=~/.vim/undo undolevels=99999
set nowrap
set number
set scrolloff=999
set showcmd
set showmatch
set term=xterm-256color
set wildmenu wildmode=longest:full,full wildcharm=<Tab>
syntax on

" Colors
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
let g:onedark_termcolors=256


" Key Mappings
let mapleader=','
nnoremap <leader>, :let @/=''<CR>:noh<CR>
nnoremap <leader># :g/\v^(#\|$)/d_<CR>
nnoremap <leader>l :set list! list?<CR>
nnoremap <leader>n :set number! number?<CR>
nnoremap <leader>p :set invpaste paste?<CR>
nnoremap <leader>r :retab<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>t :%s/\s\+$//e<CR>
nnoremap <leader>w :set wrap! wrap?<CR>
nnoremap <silent><leader>d "_d
nnoremap <silent><leader>i gg=G``<CR>

" Autocomplete Settings
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
