vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})
