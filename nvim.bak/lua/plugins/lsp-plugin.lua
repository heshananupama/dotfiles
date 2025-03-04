return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pylsp", "bashls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp_config = require("lspconfig")
      lsp_config.lua_ls.setup({})
      lsp_config.bashls.setup({})
      lsp_config.pylsp.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'} , '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
