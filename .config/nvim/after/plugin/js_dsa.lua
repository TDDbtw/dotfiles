vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript","html", "typescriptreact" }, -- JS, JSX, TS, TSX
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2

    -- Comment block
    vim.api.nvim_buf_set_keymap(0, 'i', '<C-s>', '/*  */<Left><Left><Left>', { noremap = true, silent = true })

    -- Quick console.log snippet
    vim.api.nvim_buf_set_keymap(0, 'i', '<C-l>', 'console.log();<Left><Left>', { noremap = true, silent = true })

    -- JSX/TSX specific keymaps
    if vim.bo.filetype == "javascriptreact" or vim.bo.filetype == "typescriptreact" then
      vim.api.nvim_buf_set_keymap(0, 'i', '<C-j>', '<></><Left><Left>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 'i', '<C-k>', '<div></div><Left><Left><Left><Left><Left><Left>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 'i', '<C-c>', ' className=""<Left>', { noremap = true, silent = true })

      -- Insert basic React functional component
      vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rc', [[:call append(line('.'), ['import React from "react";', '', 'function ComponentName() {', '  return (', '    <div>', '      ', '    </div>', '  );', '}', '', 'export default ComponentName;'])<CR>]], { noremap = true, silent = true })

      -- Insert JSX expression curly braces
      vim.api.nvim_buf_set_keymap(0, 'i', '<C-e>', '{}<Left>', { noremap = true, silent = true })

      -- Wrap selected text in JSX tag (visual mode)
      vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>wt', [[c<<C-r>=input('Tag: ')<CR>>><C-r>"</<C-r>=input('Tag: ')<CR>><Esc>]], { noremap = true, silent = true })
    end
  end
})

