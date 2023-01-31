vim.api.nvim_create_autocmd(
    {
        "BufWritePre",
    },
    {
        callback = function()
            vim.lsp.buf.format()
        end,
    }
)

vim.cmd("highlight ExtraWhiteSpace ctermbg=red guibg=red")
vim.cmd("match ExtraWhiteSpace /\\s\\+$/")