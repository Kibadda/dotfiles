Plug 'Kibadda/vim-test'

let test#php#phpunit#executable = 'XDEBUG_MODE=coverage vendor/bin/pest'
let test#php#pest#executable = 'XDEBUG_MODE=coverage vendor/bin/pest'
let test#php#dusk#executable = 'XDEBUG_MODE=coverage php artisan pest:dusk'

" let test#php#phpunit#options = '--verbose --debug'
" let test#php#pest#executable = '--verbose --debug'
" let test#php#dusk#executable = '--verbose --debug'

let g:test#basic#start_normal = 1

let test#strategy = "neovim"
let test#neovim#term_position = "topleft"
let test#neovim#term_position = "vert"
let test#neovim#term_position = "vert botright 100"

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

nmap <leader>tnn :TestNearest<CR>
nmap <leader>tff :TestFile<CR>
nmap <leader>tss :TestSuite<CR>
nmap <leader>tll :TestLast<CR>
nmap <leader>tvv :TestVisit<CR>

" Laravel Dusk tests with browse option
nmap <leader>tnb :TestNearest --browse<CR>
nmap <leader>tfb :TestFile --browse<CR>
nmap <leader>tlb :TestLast --browse<CR>

" Coverage
nmap <leader>tfc :TestFile --coverage<CR>
nmap <leader>tsc :TestSuite --coverage<CR>
nmap <leader>tlc :TestLast --coverage<CR>


augroup AutoDeleteTestTermBuffers
    autocmd!
    autocmd BufLeave term://*artisan\stest* bdelete!
    autocmd BufLeave term://*phpunit* bdelete!
    autocmd BufLeave term://*pest* bdelete!
augroup END
