Plug 'drewtempelmeyer/palenight.vim'

set background=dark
let g:palenight_terminal_italics=1

augroup OneDarkOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme palenight
augroup end
