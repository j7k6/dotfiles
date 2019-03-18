" Basic
set backspace=indent,eol,start                          " backspace behaviour
set clipboard=unnamed,unnamedplus                       " enable clipboard
set encoding=utf8                                       " enable utf8 support
set hidden                                              " hide buffers, don't close
set lazyredraw nocursorline ttyfast                     " performance tuning
set mouse=a                                             " enable mouse support
set number                                              " show line numbers
set showcmd                                             " show command keys
set term=xterm-256color                                 " terminal type
set wildmenu wildmode=longest:full,full wildcharm=<Tab> " wildmenu character

" UI
filetype plugin indent on                               " enable filetype detection
set listchars=eol:¶,trail:•,tab:▸\  showbreak=¬\        " whitespace characters
set nowrap                                              " disable wrapping
set scrolloff=999                                       " center cursor position vertically
set showmatch                                           " show matching brackets
syntax on                                               " enable syntax highlightning

" Colors
colorscheme onedark                                     " set colorscheme
hi Normal guibg=NONE ctermbg=NONE|                      " transparency fix
let g:onedark_termcolors=256                            " enable 256 colors support

" Ruler
set laststatus=0 ruler rulerformat=%50(%=%<%F%m\ ›\ %{getfsize(@%)}B\ \›\ %l/%L:%v%)

" Tabs & Indentation
set autoindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Search
set hlsearch ignorecase incsearch smartcase

" Undo & Backup
set nobackup noswapfile nowritebackup undofile undodir=~/.vim/undo undolevels=99999

" Key Mappings
let mapleader=','                                " leader key
nnoremap <leader>, :let @/=''<CR>:noh<CR>|       " clear search
nnoremap <leader># :g/\v^(#\|$)/d_<CR>|          " delete commented/blank lines
nnoremap <leader>l :set list! list?<CR>|         " toggle list (special chars)
nnoremap <leader>n :set number! number?<CR>|     " toggle list (special chars)
nnoremap <leader>p :set invpaste paste?<CR>|     " toggle paste mode
nnoremap <leader>r :retab<CR>|                   " convert tabs to spaces
nnoremap <leader>s :source $MYVIMRC<CR>|         " reload .vimrc
nnoremap <leader>t :%s/\s\+$//e<CR>|             " trim whitespace
nnoremap <leader>w :set wrap! wrap?<CR>|         " toggle wrapping
nnoremap <silent><leader>d "_d|                  " delete selected text
nnoremap <silent><leader>i gg=G``<CR>|           " fix indentation

" Autocomplete Settings
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
