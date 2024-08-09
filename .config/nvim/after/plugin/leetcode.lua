
local leetcode = require("leetcode")
leetcode.setup({
    ---@type string
    arg = "leetcode.nvim",
    force_new_window = true,
    ---@type lc.lang
    lang = "javascript",
    cn = { -- leetcode.cn
        enabled = false, ---@type boolean
        translator = true, ---@type boolean
        translate_problems = true, ---@type boolean
    },
    ---@type lc.storage
    -- storage = {
    --     home = vim.fn.stdpath("data") .. "~/myFiles/leetcode",
    --     cache = vim.fn.stdpath("cache") .. "~/myFiles/leetcode",
    -- },
    storage = {
        home = vim.fn.expand("~/myFiles/leetcode"),
        cache = vim.fn.expand("~/myFiles/leetcode/cache"),
    },
    ---@type table<string, boolean>
    plugins = {
        -- non_standalone = false,
        non_standalone = true,
    },
    ---@type boolean
    logging = true,
    injector = {
        ---@type table<lc.lang, lc.inject>
        ["javascript"] = {
            before = { "// LeetCode JavaScript solution", "// @param {*} param", "// @return {*}", "" },
            after = "",
        },
    },
    cache = {
        update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
    },
    console = {
        open_on_runcode = true, ---@type boolean
        dir = "row", ---@type lc.direction
        size = { ---@type lc.size
            width = "90%",
            height = "75%",
        },
        result = {
            size = "60%", ---@type lc.size
        },
        testcase = {
            virt_text = true, ---@type boolean
            size = "40%", ---@type lc.size
        },
    },
    description = {
        position = "left", ---@type lc.position
        width = "40%", ---@type lc.size
        show_stats = true, ---@type boolean
    },
    hooks = {
        ---@type fun()[]
        ["enter"] = {},
        ---@type fun(question: lc.ui.Question)[]
        ["question_enter"] = {},
        ---@type fun()[]
        ["leave"] = {},
    },
    keys = {
        toggle = { "q" }, ---@type string|string[]
        confirm = { "<CR>" }, ---@type string|string[]
        reset_testcases = "r", ---@type string
        use_testcase = "U", ---@type string
        focus_testcases = "H", ---@type string
        focus_result = "L", ---@type string
    },
    ---@type lc.highlights
    theme = {},
    ---@type boolean
    image_support = false,
    cookies = {
        LEETCODE_SESSION = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfYXV0aF91c2VyX2lkIjoiOTcyNTI4NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGNiMDMxZWQxODAzMDM0NDk5NzAxOTI4OGZjZTgwMTI5MDhhNGVhYzJkOTIyOWJiZTRkOGJmNzhiNzQ1MTg2ZiIsImlkIjo5NzI1Mjg1LCJlbWFpbCI6ImJwYnQxOCtsY0BnbWFpbC5jb20iLCJ1c2VybmFtZSI6IkJhc2lsX1AiLCJ1c2VyX3NsdWciOiJCYXNpbF9QIiwiYXZhdGFyIjoiaHR0cHM6Ly9hc3NldHMubGVldGNvZGUuY29tL3VzZXJzL2RlZmF1bHRfYXZhdGFyLmpwZyIsInJlZnJlc2hlZF9hdCI6MTcyMTcwNjU1NiwiaXAiOiIxMDYuMjIyLjIzNi43MyIsImlkZW50aXR5IjoiMzgzYzZkNGQ0Nzc1ZDY5ODJmNzdmZGE4ZWZkM2E1ZWUiLCJzZXNzaW9uX2lkIjo2MDcwNjgzOCwiX3Nlc3Npb25fZXhwaXJ5IjoxMjA5NjAwLCJkZXZpY2Vfd2l0aF9pcCI6WyJkNDcwNDYzYmNjNTFkZDAwZWVkZjg2MWMyMTRiZDkzMCIsIjEwNi4yMjIuMjM2LjczIl19.zykXizhHn8-GOfLDSV5Hfhq3ioYQHqhJBIs0ApF9gzE",
        csrftoken = "VimblBVqw89cnmTE0ZWAbvijFD7ro2kg4pJJtzfnb5ZZfGg5OJ8VWzQzTEOyTBWg",
    }
})

-- Keybindings
vim.keymap.set("n", "<leader>pm", ":Leet menu<CR>", { silent = true, desc = "LeetCode Menu" })
vim.keymap.set("n", "<leader>pp", ":Leet list<CR>", { silent = true, desc = "List Problems" })
vim.keymap.set("n", "<leader>pt", ":Leet test<CR>", { silent = true, desc = "Run Test Cases" })
vim.keymap.set("n", "<leader>pS", ":Leet submit<CR>", { silent = true, desc = "Submit Solution" })
vim.keymap.set("n", "<leader>pi", ":Leet info<CR>", { silent = true, desc = "Problem Info" })
vim.keymap.set("n", "<leader>pr", ":Leet run<CR>", { silent = true, desc = "Run Code" })

-- Quick navigation to specific problem difficulties
vim.keymap.set("n", "<leader>ye", function() vim.cmd("Leet list difficulty=easy") end, { silent = true, desc = "List Easy Problems" })
vim.keymap.set("n", "<leader>lm", function() vim.cmd("Leet list medium") end, { silent = true, desc = "List Medium Problems" })
vim.keymap.set("n", "<leader>lh", function() vim.cmd("Leet list hard") end, { silent = true, desc = "List Hard Problems" })
vim.keymap.set("n", "<leader>lO", function() vim.cmd("Leet open") end, { silent = true, desc = "List Hard Problems" })
