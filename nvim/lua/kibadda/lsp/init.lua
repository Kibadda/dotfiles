local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local lspconfig_util = require "lspconfig.util"

local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
  nvim_status = nil
end

local telescope_mapper = require "kibadda.telescope.mappings"
local handlers = require "kibadda.lsp.handlers"

local ts_util = require "nvim-lsp-ts-utils"

local status = require "kibadda.lsp.status"
if status then
  status.activate()
end

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local augroup_format = vim.api.nvim_create_augroup("my_lsp_format", { clear = true })
local autocmd_format = function(async, filter)
  vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = 0,
    callback = function()
      vim.lsp.buf.format { async = async, filter = filter }
    end,
  })
end

local filetype_attach = setmetatable({
  scss = function()
    autocmd_format(false)
  end,

  css = function()
    autocmd_format(false)
  end,
}, {
  __index = function()
    return function() end
  end,
})

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  if nvim_status then
    nvim_status.on_attach(client)
  end

  vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = 0 })

  vim.keymap.set("n", "<Leader>cr", handlers.rename, { buffer = 0 })
  vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = 0 })

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })

  vim.keymap.set("n", "gI", handlers.implementation, { buffer = 0 })
  vim.keymap.set("n", "<Leader>lr", "<CMD>lua R('kibadda.lsp.codelens').run()<CR>", { buffer = 0 })
  -- vim.keymap.set("n", "<Leader>rr", "<CMD>LspRestart<CR>", { buffer = 0 })

  telescope_mapper("gr", "lsp_references", nil, true)
  telescope_mapper("gI", "lsp_implementations", nil, true)
  telescope_mapper("<Leader>wd", "lsp_document_symbols", { ignore_filename = true }, true)
  telescope_mapper("<Leader>ww", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)

  if filetype ~= "lua" then
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  end

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.server_capabilities.codeLensProvider then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufEnter ++once <buffer> lua require"vim.lsp.codelens".refresh()
        autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
      augroup END
    ]]
  end

  filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
if nvim_status then
  updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
end
updated_capabilities.textDocument.codelens = { dynamicRegistation = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

local servers = {
  pyright = true,
  yamlls = true,

  vimls = {
    cmd = { "/home/michael/.nvm/versions/node/v16.14.2/bin/vim-language-server", "--stdio" },
  },

  html = {
    cmd = { "/home/michael/.nvm/versions/node/v16.14.2/bin/vscode-html-language-server", "--stdio" },
  },

  -- eslint = {
  --   cmd = { "/home/michael/.nvm/versions/node/v16.14.2/bin/vscode-eslint-language-server", "--stdio" },
  -- },

  cssls = {
    cmd = { "/home/michael/.nvm/versions/node/v16.14.2/bin/vscode-css-language-server", "--stdio" },
  },

  volar = {
    cmd = { "/home/michael/.nvm/versions/node/v16.14.2/bin/vue-language-server", "--stdio" },
  },

  tsserver = {
    init_options = ts_util.init_options,
    cmd = { "/home/michael/.nvm/versions/node/v16.14.2/bin/typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    on_attach = function(client)
      custom_attach(client)
      ts_util.setup { auto_inlay_hints = false }
      ts_util.setup_client(client)
    end,
  },

  intelephense = {
    cmd = { "/home/michael/.nvm/versions/node/v16.14.2/bin/intelephense", "--stdio" },
    settings = {
      intelephense = {
        stubs = require "kibadda.lsp.php_extensions",
        format = {
          braces = "k&r",
          insertSpaces = true,
          tabSize = 4,
        },
        diagnostics = {
          enable = true,
        },
        phpdoc = {
          textFormat = "text",
          functionTemplate = {
            summary = "$1",
            tags = {
              "@param ${1:$SYMBOL_TYPE} $SYMBOL_NAME",
              "@return ${1:$SYMBOL_TYPE}",
              "@throws ${1:$SYMBOL_TYPE}",
            },
          },
        },
      },
    },
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, config)

  lspconfig[server].setup(config)
end

_ = require("nlua.lsp.nvim").setup(lspconfig, {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,

  root_dir = function(fname)
    if string.find(vim.fn.fnamemodify(fname, ":p"), ".dotfiles/nvim/") then
      return vim.fn.expand "~/.dotfiles/nvim/"
    end

    return lspconfig_util.find_git_ancestor(fname) or lspconfig_util.path.dirname(fname)
  end,

  globals = {
    "Color",
    "c",
    "Group",
    "g",
    "s",

    "RELOAD",
  },

  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

for server, config in pairs(servers) do
  setup_server(server, config)
end

if pcall(require, "sg.lsp") then
  require("sg.lsp").setup {
    on_init = custom_init,
    on_attach = custom_attach,
  }
end

require("null-ls").setup {
  sources = {
    require("null-ls").builtins.formatting.prettierd,
  },
}

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
