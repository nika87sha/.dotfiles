return{
    "nvimtools/none-ls.nvim",

    config = function ()
        local null_ls = requiere("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.gdformat,
                null_ls.builtins.formatting.csharpier,
            },
        })
    end,
}
