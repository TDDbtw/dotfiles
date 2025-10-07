require("obsidian").setup({

 dir = "~/myFiles",
  -- dir = "~/works",

  -- Add other options as needed
  --
 notes_subdir = "brototype",
 -- notes_subdir = "writing",

  daily_notes = {
    folder = "dailies",
    date_format = "%Y-%m-%d"
  },
  completion = {
    nvim_cmp = true,
  },
})
