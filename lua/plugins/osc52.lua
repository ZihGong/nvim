return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({
      silent = false, -- 显示复制成功提示
      trim = false, -- 不自动去除首尾空白
    })
  end,
} 