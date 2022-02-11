Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

nnoremap <silent> <leader>du :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>


let g:db_ui_save_location = '~/.config/nvim/d_ui'

" Plug 'dinhhuy258/vim-database', {'branch': 'master', 'do': ':UpdateRemotePlugins'}
