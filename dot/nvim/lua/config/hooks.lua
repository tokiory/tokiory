-- Autload external changes
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" and vim.fn.bufname() ~= "" then
            vim.cmd("silent! checktime")
        end
    end,
})
