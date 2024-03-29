local utils_options = require "user.utils.options"

utils_options.set {
  completeopt = "menuone,noselect",
  pumblend = 0,
  wildmode = "longest:full,full",
  wildoptions = "pum",
  cmdheight = 1,
  relativenumber = true,
  number = true,
  ignorecase = true,
  smartcase = true,
  splitright = true,
  splitbelow = true,
  updatetime = 250,
  scrolloff = 8,
  sidescrolloff = 8,
  cursorline = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  breakindent = true,
  showbreak = "|-> ",
  linebreak = true,
  foldenable = false,
  modelines = 1,
  clipboard = "unnamedplus",
  inccommand = "split",
  swapfile = false,
  undofile = true,
  shada = "!,'1000,<50,s10,h",
  mouse = "nv",
  diffopt = "internal,filler,closeoff,hiddenoff,algorithm:minimal",
  laststatus = 3,
  signcolumn = "no",
  showtabline = 2,
  timeoutlen = 100,
  termguicolors = true,
  formatoptions = require("user.utils.globals").get("", "formatoptions"),
  textwidth = 120,
  fileformats = "unix",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal,globals",
  spell = false,
  showmode = false,
}

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    utils_options.set {
      hlsearch = vim.tbl_contains({ "n", "N", "*", "#", "?", "/", "z" }, vim.fn.keytrans(char)),
    }
  end
end, vim.api.nvim_create_namespace "auto_hlsearch")
