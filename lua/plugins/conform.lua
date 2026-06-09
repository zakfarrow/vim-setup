return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
    {
      "<leader>tf",
      function()
        vim.g.format_on_save = not vim.g.format_on_save
        print("Format on save: " .. (vim.g.format_on_save and "ON" or "OFF"))
      end,
      desc = "Toggle format on save",
    },
  },
  config = function()
    vim.g.format_on_save = true

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
      format_on_save = function()
        if vim.g.format_on_save then
          return { timeout_ms = 500, lsp_fallback = true }
        end
      end,
    })
  end,
}
