"-----------------------------------------------------
" General Settings
"-----------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
" set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=10
set sidescrolloff=10
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
" set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set nocompatible

"-----------------------------------------------------
" Key maps
"-----------------------------------------------------

noremap j h
noremap k j
noremap l k
noremap ö l

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>kk ]b
nmap <leader>ll [b
nmap <leader>K :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>
nmap <leader>A :A<CR>
nmap <leader>w :w<CR>
" nmap gt ]b
" nmap gT [b

" nmap <silent> <C-j> <C-w>h
nmap <silent> <C-k> <C-w>h
nmap <silent> <C-l> <C-w>l
" nmap <silent> <C-;> <C-w>l

map gf :edit <cfile><cr>

vnoremap < <gv
vnoremap > >gv

vnoremap y myy`y
vnoremap Y myY`y

nmap <leader>; A;<Esc>
nmap <leader>, A,<Esc>

cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'Sayonara' : 'q'

vnoremap <C-r> "_y:%s/<C-r>h//gc<left><left><left>

"-----------------------------------------------------
" Plugins
"-----------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim/ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.local/share/nvim/plugins/abolish.vim
source ~/.local/share/nvim/plugins/airline.vim
source ~/.local/share/nvim/plugins/coc.vim
source ~/.local/share/nvim/plugins/commentary.vim
source ~/.local/share/nvim/plugins/context-commentstring.vim
source ~/.local/share/nvim/plugins/editorconfig.vim
source ~/.local/share/nvim/plugins/eunuch.vim
source ~/.local/share/nvim/plugins/exchange.vim
" source ~/.local/share/nvim/plugins/dadbod.vim
source ~/.local/share/nvim/plugins/dispatch.vim
" source ~/.local/share/nvim/plugins/dracula.vim
source ~/.local/share/nvim/plugins/floaterm.vim
source ~/.local/share/nvim/plugins/fugitive.vim
source ~/.local/share/nvim/plugins/fzf.vim
source ~/.local/share/nvim/plugins/heritage.vim
source ~/.local/share/nvim/plugins/laravel.vim
source ~/.local/share/nvim/plugins/lastplace.vim
source ~/.local/share/nvim/plugins/lion.vim
source ~/.local/share/nvim/plugins/markdown-preview.vim
source ~/.local/share/nvim/plugins/nerdtree.vim
source ~/.local/share/nvim/plugins/obsession.vim
source ~/.local/share/nvim/plugins/onedark.vim
source ~/.local/share/nvim/plugins/palenight.vim
source ~/.local/share/nvim/plugins/pasta.vim
source ~/.local/share/nvim/plugins/peekaboo.vim
source ~/.local/share/nvim/plugins/polyglot.vim
source ~/.local/share/nvim/plugins/projectionist.vim
source ~/.local/share/nvim/plugins/quickscope.vim
source ~/.local/share/nvim/plugins/repeat.vim
source ~/.local/share/nvim/plugins/rooter.vim
source ~/.local/share/nvim/plugins/sayonara.vim
source ~/.local/share/nvim/plugins/splitjoin.vim
source ~/.local/share/nvim/plugins/speeddating.vim
source ~/.local/share/nvim/plugins/surround.vim
source ~/.local/share/nvim/plugins/targets.vim
source ~/.local/share/nvim/plugins/textobj-xamlattr.vim
source ~/.local/share/nvim/plugins/unimpaired.vim
source ~/.local/share/nvim/plugins/vim-blade.vim
source ~/.local/share/nvim/plugins/vim-test.vim
source ~/.local/share/nvim/plugins/visual-multi.vim
source ~/.local/share/nvim/plugins/visual-star-search.vim
source ~/.local/share/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded

"-----------------------------------------------------
" Misc
"-----------------------------------------------------

augroup FileTypeOverrides
    autocmd!
    autocmd FileType php setlocal commentstring=//%s
    autocmd TermOpen * setlocal nospell
augroup END
