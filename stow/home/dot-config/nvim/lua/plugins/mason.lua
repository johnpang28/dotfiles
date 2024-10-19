return {
  "williamboman/mason.nvim",
  name = "mason",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { "gopls", "lua_ls" }
    })
  end,
}
