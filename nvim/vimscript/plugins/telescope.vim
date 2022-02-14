Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

nmap <leader>f :Telescope find_files find_command=rg,--hidden,--files,--ignore<cr>
nmap <leader>F :Telescope find_files find_command=rg,--hidden,--files,--no-ignore<cr>
nmap <leader>b :Telescope buffers<cr>
nmap <leader>h :Telescope old_files<cr>
nmap <leader>s :Telescope live_grep<cr>
nmap <leader>gb :Telescope git_branches<cr>
