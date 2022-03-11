"-----------------------------------------------------
" Global
"-----------------------------------------------------

let mapleader = "\<space>"

" noremap j h
" noremap k j
" noremap l k
" noremap ö l

map gf :edit <cfile><CR>

"-----------------------------------------------------
" Normal
"-----------------------------------------------------

nmap <leader>ve :edit ~/.config/nvim/init.vim<CR>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<CR>
nmap <leader>vr :source ~/.config/nvim/init.vim<CR>
nmap <leader>jj ]b
nmap <leader>kk [b
nmap <leader>K :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<CR>
nmap <leader>A :A<CR>
nmap <leader>w :w<CR>
nmap <leader>c A;<ESC>
nmap <leader>, A,<ESC>
nmap <leader>pc :pc<CR>
nmap <leader>vs :vs<CR><C-w><C-w>

nmap <silent> <C-k> <C-w>h
nmap <silent> <C-j> <C-w>l

nnoremap * *<C-o>

"-----------------------------------------------------
" Visual
"-----------------------------------------------------

vnoremap < <gv
vnoremap > >gv

vnoremap y myy`y
vnoremap Y myY`y

vnoremap <C-r> "hy:%s/<C-r>h//gc<LEFT><LEFT><LEFT>
