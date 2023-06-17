local utils = require("utils")


return {
    mappings = {
        n = {
            ["<leader>n"] = utils.wrap_func("new_file"),
            ["<leader>w"] = utils.wrap_func("save_file"),
        },
    },
    funcs = {
        new_file = {
            func = function()
                vim.cmd("enew")
            end,
            desc = "Create a new file",
        },
        save_file = {
            func = function()
                local file_name = vim.fn.bufname()
                if file_name == "" then
                    file_name = vim.fn.input("Filename (esc or leave empty to cancel): ", "", "file")
                    if file_name == nil or file_name == "" then
                        return
                    end
                end
                vim.cmd("write " .. file_name)
            end,
            desc = "Save the current file", 
        }
    },
}
