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
colorscheme gruvbox
" colorscheme onedark
" let g:onedark_termcolors=256
hi Normal guibg=NONE ctermbg=NONE
hi TabLineFill ctermfg=Black ctermbg=LightGrey cterm=NONE
hi TabLine ctermfg=Black ctermbg=LightGrey cterm=NONE
hi TabLineSel ctermfg=LightGrey ctermbg=Black cterm=NONE
hi Title ctermfg=NONE ctermbg=NONE cterm=NONE

" Key Mappings
let mapleader=','
nnoremap <leader>, :let @/=''<CR>:noh<CR>
nnoremap <leader># :g/\v^(#\|$)/d_<CR>
nnoremap <leader>l :set list! list?<CR>
nnoremap <leader>n :set number! number?<CR>
nnoremap <leader>p :set invpaste paste?<CR>
nnoremap <leader>r :retab<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>W :%s/\s\+$//e<CR>
nnoremap <leader>w :set wrap! wrap?<CR>
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>t :tabedit <TAB><TAB>
nnoremap <leader>v :vsplit <TAB><TAB>
nnoremap <leader>h :split <TAB><TAB>
nnoremap <silent><leader>d "_d
nnoremap <silent><leader>i gg=G``<CR>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Autocomplete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#Complete#CompletePHP

" File Browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
