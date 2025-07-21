-- 主题配置：系统浅色时使用 Catppuccin Latte，系统深色时使用 Dracula
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- 自动根据系统主题选择
        background = {
          light = "latte", -- 浅色模式使用 latte
          dark = "mocha", -- 深色模式先用 mocha，稍后会切换到 dracula
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
  -- 主题切换逻辑
  {
    "LazyVim/LazyVim",
    opts = function()
      -- 检测系统主题
      local function get_system_appearance()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          return result:match("Dark") and "dark" or "light"
        end
        return "dark" -- 默认深色
      end
      
      -- 根据系统主题设置配色方案
      local appearance = get_system_appearance()
      local colorscheme = appearance == "light" and "catppuccin-latte" or "dracula"
      
      return {
        colorscheme = colorscheme,
      }
    end,
  },
}
