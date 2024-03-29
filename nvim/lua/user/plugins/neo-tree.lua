local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  cmd = "Neotree",
}

function M.init()
  require("user.utils.register").keymaps {
    n = {
      ["<Leader>"] = {
        e = { "<Cmd>Neotree reveal<CR>", "Open/Focus Neotree" },
        E = { "<Cmd>Neotree close<CR>", "Close Neotree" },
      },
    },
  }
end

M.opts = {
  close_if_last_window = true,
  popup_border_style = "single",
  window = {
    position = "right",
    width = 50,
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
  },
}

return M
