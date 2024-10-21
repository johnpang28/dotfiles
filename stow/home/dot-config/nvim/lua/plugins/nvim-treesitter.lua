return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "go",
          "java",
          "json",
          "kotlin",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "toml",
          "vim",
          "vimdoc",
          "yaml",
        }
      })
    end
  }
}
