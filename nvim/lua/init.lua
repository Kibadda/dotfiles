----------------------------------------------------------------------------------------------
-- Functions
----------------------------------------------------------------------------------------------

local fun = require 'usermod.functions'

----------------------------------------------------------------------------------------------
-- Settings
----------------------------------------------------------------------------------------------

fun.global('mapleader', ' ')

fun.set('number', true)
fun.set('relativenumber', true)
fun.set('scrolloff', 10)
fun.set('sidescrolloff', 10)
fun.set('ignorecase', true)
fun.set('smartcase', true)
fun.set('expandtab', true)
fun.set('tabstop', 4)
fun.set('shiftwidth', 4)
fun.set('hidden', true)
fun.set('signcolumn', 'yes:2')
fun.set('termguicolors', true)
fun.set('undofile', true)
fun.set('title', true)
fun.set('wildmode', 'longest:full,full')
fun.set('wrap', false)
fun.set('joinspaces', false)
fun.set('splitright', true)
fun.set('clipboard', 'unnamedplus')
fun.set('confirm', true)
fun.set('backup', true)
fun.set('backupdir', '~/.config/nvim/backup/')
fun.set('updatetime', 300)
fun.set('redrawtime', 10000)
fun.set('compatible', false)

----------------------------------------------------------------------------------------------
-- Keymaps
----------------------------------------------------------------------------------------------

fun.map('', 'j', 'h', {noremap = true})
fun.map('', 'k', 'j', {noremap = true})
fun.map('', 'l', 'k', {noremap = true})
fun.map('', 'ö', 'l', {noremap = true})

fun.map('n', '<leader>w', ':w<CR>', {})
fun.map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>', {})
fun.map('n', '<leader>vr', ':source ~/.config/nvim/init.lua<CR>', {})
fun.map('n', '<leader>K', ':nohlsearch<CR>', {})
fun.map('n', '<leader>kk', ']b', {})
fun.map('n', '<leader>ll', '[b', {})
fun.map('n', '<leader>Q', ':bufdo bdelete<CR>', {})
fun.map('n', '<leader>A', ':A<CR>', {})
fun.map('n', '<leader>;', 'A;<ESC>', {})
fun.map('n', '<leader>,', 'A,<ESC>', {})

-- fun.map('v', '<', '<gv', {noremap = true})
-- fun.map('v', '>', '>gv', {noremap = false})
-- fun.map('v', 'y', 'myy`y', {noremap = false})
-- fun.map('v', 'Y', 'myY`y', {noremap = false})
-- fun.map('v', '<C-r>', '"_y:%s/<C-r>h//gc<LEFT><LEFT><LEFT>', {noremap = false})

fun.map('n', 'gf', ':edit <cfile><CR>', {})

----------------------------------------------------------------------------------------------
-- Plugins
----------------------------------------------------------------------------------------------

Plug = require 'usermod.vimplug'

Plug.begin('~/.config/nvim/plugged')

require 'palenight'

Plug.ends()

-- After plugins loaded
vim.cmd('colorscheme palenight')
