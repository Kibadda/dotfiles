"-----------------------------------------------------
" General Settings
"-----------------------------------------------------
source ~/.local/share/nvim/config/settings.vim

"-----------------------------------------------------
" Key maps
"-----------------------------------------------------
source ~/.local/share/nvim/config/keymaps.vim

"-----------------------------------------------------
" Plugins
"-----------------------------------------------------

" Install Vim-Plug if it is not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim/ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.local/share/nvim/plugins/abolish.vim
source ~/.local/share/nvim/plugins/airline.vim
source ~/.local/share/nvim/plugins/auto-session.vim
source ~/.local/share/nvim/plugins/coc.vim
source ~/.local/share/nvim/plugins/color-schemes.vim
source ~/.local/share/nvim/plugins/commentary.vim
source ~/.local/share/nvim/plugins/context-commentstring.vim
source ~/.local/share/nvim/plugins/editorconfig.vim
source ~/.local/share/nvim/plugins/eunuch.vim
source ~/.local/share/nvim/plugins/exchange.vim
source ~/.local/share/nvim/plugins/dispatch.vim
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
" source ~/.local/share/nvim/plugins/onedark.vim
" source ~/.local/share/nvim/plugins/palenight.vim
source ~/.local/share/nvim/plugins/pasta.vim
source ~/.local/share/nvim/plugins/peekaboo.vim
source ~/.local/share/nvim/plugins/polyglot.vim
source ~/.local/share/nvim/plugins/projectionist.vim
source ~/.local/share/nvim/plugins/quickscope.vim
source ~/.local/share/nvim/plugins/repeat.vim
source ~/.local/share/nvim/plugins/rooter.vim
source ~/.local/share/nvim/plugins/sayonara.vim
source ~/.local/share/nvim/plugins/smarty.vim
source ~/.local/share/nvim/plugins/splitjoin.vim
source ~/.local/share/nvim/plugins/speeddating.vim
source ~/.local/share/nvim/plugins/surround.vim
source ~/.local/share/nvim/plugins/targets.vim
source ~/.local/share/nvim/plugins/textobj-xamlattr.vim
source ~/.local/share/nvim/plugins/unimpaired.vim
source ~/.local/share/nvim/plugins/vim-blade.vim
source ~/.local/share/nvim/plugins/vim-php-cs-fixer.vim
source ~/.local/share/nvim/plugins/vim-test.vim
source ~/.local/share/nvim/plugins/visual-multi.vim
source ~/.local/share/nvim/plugins/visual-star-search.vim
source ~/.local/share/nvim/plugins/which-key.vim

call plug#end()
" Load colorscheme after plugins loaded
doautocmd User PlugLoaded
au BufRead,BufNewFile *.tpl set filetype=smarty 

"-----------------------------------------------------
" Misc
"-----------------------------------------------------

augroup FileTypeOverrides
    autocmd!
    autocmd FileType php setlocal commentstring=//%s
augroup END
