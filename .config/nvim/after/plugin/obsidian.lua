require("obsidian").setup({

  dir = "~/myFiles",
  -- Add other options as needed
  --
 notes_subdir = "brototype",
  daily_notes = {
    folder = "dailies",
    date_format = "%Y-%m-%d"
  },
  completion = {
    nvim_cmp = true,
  },
})
