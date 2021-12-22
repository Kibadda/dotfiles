----------------------------------------------------------------------------------------------
-- Functions
----------------------------------------------------------------------------------------------

function map(mode, shortcut, command, options)
    vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

function set(setting, value)
    vim.o[setting] = value
end

function global(setting, value)
    vim.g[setting] = value
end

----------------------------------------------------------------------------------------------
-- Settings
----------------------------------------------------------------------------------------------

global('mapleader', ' ')

set('number', true)
set('relativenumber', true)
set('scrolloff', 10)
set('sidescrolloff', 10)
set('ignorecase', true)
set('smartcase', true)
set('expandtab', true)
set('tabstop', 4)
set('shiftwidth', 4)
set('hidden', true)
set('signcolumn', 'yes:2')
set('termguicolors', true)
set('undofile', true)
set('title', true)
set('wildmode', 'longest:full,full')
set('wrap', false)
set('joinspaces', false)
set('splitright', true)
set('clipboard', 'unnamedplus')
set('confirm', true)
set('backup', true)
set('backupdir', '~/.config/nvim/backup/')
set('updatetime', 300)
set('redrawtime', 10000)
set('compatible', false)

----------------------------------------------------------------------------------------------
-- Keymaps
----------------------------------------------------------------------------------------------

map('', 'j', 'h', {noremap = true})
map('', 'k', 'j', {noremap = true})
map('', 'l', 'k', {noremap = true})
map('', 'ö', 'l', {noremap = true})

map('n', '<leader>w', ':w<CR>', {})
map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>', {})
map('n', '<leader>vr', ':source ~/.config/nvim/init.lua<CR>', {})
map('n', '<leader>K', ':nohlsearch<CR>', {})
map('n', '<leader>kk', ']b', {})
map('n', '<leader>ll', '[b', {})
map('n', '<leader>Q', ':bufdo bdelete<CR>', {})
map('n', '<leader>A', ':A<CR>', {})
map('n', '<leader>;', 'A;<ESC>', {})
map('n', '<leader>,', 'A,<ESC>', {})

map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = false})
map('v', 'y', 'myy`y', {noremap = false})
map('v', 'Y', 'myY`y', {noremap = false})
map('v', '<C-r>', '"_y:%s/<C-r>h//gc<LEFT><LEFT><LEFT>', {noremap = false})

map('n', 'gf', ':edit <cfile><CR>', {})

----------------------------------------------------------------------------------------------
-- Plugins
----------------------------------------------------------------------------------------------
