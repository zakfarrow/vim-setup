vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set(
  "n",
  "<leader>tt",
  "<cmd>belowright split | terminal<CR><C-w>j",
  { desc = "Terminal in split window" }
)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- LSP keymaps (set when LSP attaches to a buffer)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go to definition" })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts, { desc = "Go to type definition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts, { desc = "Go to implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts, { desc = "Go to references" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "Hover docs" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "Rename symbol" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "Code action" })
  end,
})

-- Jump to newly split window
vim.keymap.set("n", "<C-w>s", "<C-w>s<C-w>w", { noremap = true })
vim.keymap.set("n", "<C-w>v", "<C-w>v<C-w>w", { noremap = true })

vim.keymap.set("x", "p", '"_dP', { noremap = true })
vim.keymap.set("x", "P", '"_dp', { noremap = true })
