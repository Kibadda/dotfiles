local M = {
  "rebelot/heirline.nvim",
  event = "VimEnter",
}

function M.opts()
  local statuscolumn = require "user.plugins.heirline.statuscolumn"
  local statusline = require "user.plugins.heirline.statusline"
  local winbar = require "user.plugins.heirline.winbar"
  -- local tabline = require "user.plugins.heirline.tabline"

  -- local utils = require "heirline.utils"
  local colors = require "nvim-tundra.palette.arctic"

  local align = { provider = "%=", hl = { bg = "" } }
  local space = { provider = " " }
  local bar = { provider = " | " }

  return {
    statuscolumn = {
      statuscolumn.diagnostics,
      align,
      statuscolumn.line_numbers,
      statuscolumn.gitsigns,
    },
    statusline = {
      init = function(self)
        self.mode = vim.fn.mode()
      end,
      -- default highlight
      -- hl = function(self)
      --   local name = self.modes.names[self.mode]
      --   if name == "NORMAL" or name == "TERMINAL" then
      --     return { bold = true }
      --   end

      --   return {
      --     fg = self.modes.colors[name].bg,
      --     bold = true,
      --   }
      -- end,
      static = {
        colors = colors,
        modes = {
          names = {
            n = "NORMAL",
            v = "VISUAL",
            V = "VISUAL",
            ["\22"] = "VISUAL",
            s = "SELECT",
            S = "SELECT",
            ["\19"] = "SELECT",
            i = "INSERT",
            R = "REPLACE",
            c = "COMMAND",
            r = "CONFIRM",
            ["!"] = "TERMINAL",
            t = "TERMINAL",
          },
          colors = {
            NORMAL = { bg = colors.indigo._900, fg = colors.gray._400, bold = true },
            VISUAL = { bg = colors.orange._500, fg = colors.indigo._900, bold = true },
            SELECT = { bg = colors.orange._500, fg = colors.indigo._900, bold = true },
            INSERT = { bg = colors.green._500, fg = colors.indigo._900, bold = true },
            REPLACE = { bg = colors.sand._500, fg = colors.indigo._900, bold = true },
            COMMAND = { bg = colors.indigo._500, fg = colors.indigo._900, bold = true },
            CONFIRM = { bg = colors.red._600, fg = colors.indigo._900, bold = true },
            TERMINAL = { bg = colors.indigo._900, fg = colors.gray._400, bold = true },
          },
        },
      },
      statusline.mode,
      space,
      statusline.git,
      bar,
      statusline.diagnostics,
      bar,
      statusline.filename,
      align,
      statusline.filetype,
      bar,
      statusline.lsp,
      bar,
      statusline.formatting,
      space,
      statusline.position,
    },
    winbar = {
      space,
      winbar.symbol,
      align,
      winbar.modified,
      space,
      winbar.filepath,
      winbar.lines,
      space,
    },
    -- tabline = {
    --   hl = { bg = "" },
    --   space,
    --   utils.make_buflist(
    --     utils.surround({ "▏ ", " ▕" }, "", {
    --       static = { colors = colors },
    --       tabline.buffer.icon,
    --       space,
    --       tabline.buffer.name,
    --       space,
    --       tabline.buffer.modified,
    --     }),
    --     tabline.truncate.left,
    --     tabline.truncate.right
    --   ),
    --   align,
    --   {
    --     condition = function()
    --       return #vim.api.nvim_list_tabpages() >= 2
    --     end,
    --     utils.make_tablist(tabline.tabpage),
    --   },
    -- },
  }
end

return M
