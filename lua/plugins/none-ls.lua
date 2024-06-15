
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require('null-ls')

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    command = "prettier",
                }),
            },
            on_attach = function(client, bufnr)
                if client.resolved_capabilities and client.resolved_capabilities.document_formatting then
                    vim.cmd [[
                        augroup LspFormatting
                            autocmd! * <buffer>
                            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                        augroup END
                    ]]
                end
            end,
        })
    end
}
