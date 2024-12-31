return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader><leader>",
        function()
          require("telescope.builtin").find_files({})
        end,
        desc = "Find Files",
      },
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 5,
      },
    },
  },
}

--- Search for files (respecting .gitignore)
---@param opts table: options to pass to the picker
---@field cwd string: root dir to search from (default: cwd, use utils.buffer_dir() to search relative to open buffer)
---@field find_command function|table: cmd to use for the search. Can be a fn(opts) -> tbl (default: autodetect)
---@field file_entry_encoding string: encoding of output of `find_command`
---@field follow boolean: if true, follows symlinks (i.e. uses `-L` flag for the `find` command) (default: false)
---@field hidden boolean: determines whether to show hidden files or not (default: false)
---@field no_ignore boolean: show files ignored by .gitignore, .ignore, etc. (default: false)
---@field no_ignore_parent boolean: show files ignored by .gitignore, .ignore, etc. in parent dirs. (default: false)
---@field search_dirs table: directory/directories/files to search
---@field search_file string: specify a filename to search for
---@field file_encoding string: file encoding for the previewer
