----------------------------------------------------------------------------------------------
-- Functions
----------------------------------------------------------------------------------------------
local fun = {}

function fun.map(mode, shortcut, command, options)
    vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

function fun.set(setting, value)
    vim.o[setting] = value
end

function fun.global(setting, value)
    vim.g[setting] = value
end

return fun
