return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- virtual text at end of line showing who last touched it
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 300,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    signcolumn = true, -- toggle with :Gitsigns toggle_signs
    numhl = false, -- toggle with :Gitsigns toggle_numhl
    word_diff = false, -- toggle with :Gitsigns toggle_word_diff
    preview_config = {
      border = "rounded",
      style = "minimal",
    },
  },
}
