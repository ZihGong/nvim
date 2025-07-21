return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "black", "isort" },
      lua = { "stylua" },
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
  },
}
