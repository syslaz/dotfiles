local colors = {
  flamingo = "#ff2f90",
  text = "#c4c7d1",
  surface0 = "#1e282d",
  mantle = "#2a353c",
  pink = "#eb606b",
  green = "#c3e88d",
}

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("vscode").setup({
        transparent = true,
        italic_comments = true,
        underline_links = true,
        color_overrides = require("config.colors").get_colors(),
        group_overrides = {
          CursorLine = { bg = colors.mantle },
          TelescopeMatching = { fg = colors.flamingo },
          TelescopeSelection = { bg = colors.surface0, fg = colors.text, bold = true },
          TelescopePromptPrefix = { bg = colors.mantle },
          TelescopePromptNormal = { bg = colors.mantle },
          TelescopeResultsNormal = { bg = colors.mantle },
          TelescopePreviewNormal = { bg = colors.mantle },
          TelescopePromptBorder = { bg = colors.mantle, fg = colors.surface0 },
          TelescopeResultsBorder = { bg = colors.mantle, fg = colors.surface0 },
          TelescopePreviewBorder = { bg = colors.mantle, fg = colors.surface0 },
          TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
          TelescopeResultsTitle = { fg = colors.text },
          TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
        },
      })
      require("vscode").load("dark")
    end,
  },
  -- { "rcarriga/nvim-notify", enabled = false }, -- the worst plugin ever, not meant for vim...
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function(_, opts)
  --     opts.options = opts.options or {}
  --     opts.options.theme = "vscode"
  --   end,
  -- },
  -- {
  --   "akinsho/bufferline.nvim",
  --   config = function(_, opts)
  --     require("bufferline").setup({
  --       options = {
  --         -- buffer_close_icon = "",
  --         close_command = "bdelete %d",
  --         -- close_icon = "",
  --         indicator = {
  --           style = "icon",
  --           icon = " ",
  --         },
  --         left_trunc_marker = "",
  --         modified_icon = "●",
  --         offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
  --         right_mouse_command = "bdelete! %d",
  --         right_trunc_marker = "",
  --         show_close_icon = false,
  --         show_tab_indicators = true,
  --       },
  --     })
  --   end,
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = false,
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      filesystem = {
        bind_to_cwd = true,
      },
      window = {
        width = 30, -- Adjust this value to make the window smaller or larger
      },
    },
  },
}
