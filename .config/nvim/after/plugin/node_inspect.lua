-- ~/.config/nvim/after/plugin/node_inspect.lua

-- Enable the plugin for JavaScript files
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript"},
  callback = function()
    -- Set up key mappings
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ni', ':NodeInspectStart<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>nc', ':NodeInspectConnect("127.0.0.1:9229")<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>nr', ':NodeInspectRun<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>nt', ':NodeInspectToggleBreakpoint<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ns', ':NodeInspectStepOver<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ni', ':NodeInspectStepInto<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>no', ':NodeInspectStepOut<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>nc', ':NodeInspectContinue<CR>', {noremap = true, silent = true})
  end
})

-- Optional: Set up some configuration options
vim.g.node_inspect_port = 9229
