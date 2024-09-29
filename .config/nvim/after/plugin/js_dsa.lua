local dap = require('dap')

-- Configure JavaScript debugging
dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

-- JavaScript-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    
    -- Quick console.log snippet
    vim.api.nvim_buf_set_keymap(0, 'i', '<C-l>', 'console.log();<Left><Left>', {noremap = true})
    
    -- Snippet for a basic DS class
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ds', [[:call append(line('.'), ['class DataStructure {', '  constructor() {', '    // Initialize your data structure here', '  }', '', '  // Add methods here', '}', '', 'module.exports = DataStructure;'])<CR>]], {noremap = true, silent = true})
    
    -- Snippet for algorithm function
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>al', [[:call append(line('.'), ['function algorithm(input) {', '  // Your algorithm implementation here', '}', '', 'module.exports = algorithm;'])<CR>]], {noremap = true, silent = true})

    -- toggle visual interface
    vim.api.nvim_set_keymap('n', '<Leader>du', [[:lua require'dapui'.toggle()<CR>]], {noremap = true, silent = true})
  end
})

-- Set up key mappings for debugging
vim.api.nvim_set_keymap('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', [[:lua require'dap'.toggle_breakpoint()<CR>]], {noremap = true, silent = true})

-- Set up DAP UI
local dapui = require("dapui")
dapui.setup()

-- Automatically open and close the DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Key mapping to open DAP UI
vim.api.nvim_set_keymap('n', '<Leader>du', [[:lua require'dapui'.toggle()<CR>]], {noremap = true, silent = true})
