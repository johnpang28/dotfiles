return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
          }
        },
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
        },
      })
    end
  }
}
