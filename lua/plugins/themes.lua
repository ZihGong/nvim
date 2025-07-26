-- 主题配置：系统浅色时使用 Catppuccin Latte，系统深色时使用 Dracula
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- 固定使用 latte 作为浅色主题
        background = {
          light = "latte",
          dark = "latte",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          which_key = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        },
      })
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = false,
        show_end_of_buffer = false,
        italic_comment = true,
      })
    end,
  },
  -- 主题切换逻辑现在由 auto-dark-mode.nvim 插件管理
}
