-- <leader> tuşunu boşluk tuşuna atama
vim.g.mapleader = " "      -- Leader tuşunu boşluk olarak ayarla
vim.g.maplocalleader = " " -- Yerel leader tuşunu da boşluk olarak ayarlar


-- Lazy tanımları yapılıyor

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "lazy.nvim yüklenemedi:\n",              "ErrorMsg" },
      { out,                                     "WarningMsg" },
      { "\nDevam etmek için bir tuşa basınız..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "lazy_tanimlari"

-- load plugins
require("lazy").setup({
  { import = "eklentiler" },
}, lazy_config)


require("ayarlar.renkleri_bul")
require("ayarlar.init")
require("eklentiler.init")
require("otocmd")
require("ayarlar.whichkey")
