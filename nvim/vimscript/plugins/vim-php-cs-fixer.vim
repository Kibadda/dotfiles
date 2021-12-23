Plug 'stephpy/vim-php-cs-fixer'

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
