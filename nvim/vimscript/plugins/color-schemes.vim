Plug 'navarasu/onedark.nvim'
" let g:onedark_style = 'darker'

Plug 'drewtempelmeyer/palenight.vim'
set background=dark
let g:palenight_terminal_italics=1

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'rakr/vim-one'
set background=dark
let g:one_allow_italics=1
" call one#highlight('vimLineComment', 'cccccc', '', 'bold')

" Plug 'kyoz/purify', { 'rtp': 'vim' }
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'arzg/vim-colors-xcode'


augroup ColorSchemeOverride
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme one
augroup end
