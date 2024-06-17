return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim"
    },
    config = function()
        local null_ls = require('null-ls')

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.stylelint,
                null_ls.builtins.diagnostics.checkstyle.with({
                    extra_args = { "-c", "/google_checks.xml" },
                })
            },
            on_attach = function(client, bufnr)
                if client.server_capabilities.documentFormattingProvider then
                    vim.cmd [[
                        augroup LspFormatting
                            autocmd! * <buffer>
                            autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })
                        augroup END
                    ]]
                end
            end,
        })

        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier",
                "stylelint",
                "markdownlint",
                "checkstyle",
            },
            automatic_installation = true,
        })
    end
}
