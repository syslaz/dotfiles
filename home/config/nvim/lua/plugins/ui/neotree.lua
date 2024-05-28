return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      -- close_if_last_window = true,
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      filesystem = {
        bind_to_cwd = true,
      },
    },
  },
}
