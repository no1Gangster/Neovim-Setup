return {
    -- Mason setup
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                -- Custom mason configuration here (if needed)
            })
        end
    },
    -- Mason LSPConfig setup
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "tsserver" , "eslint"}
            })
        end
    },
    -- LSPConfig setup
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua language server setup
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Typescript language server setup
            lspconfig.tsserver.setup({})

            lspconfig.eslint.setup({})

            -- Keybindings for LSP
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end
    }
}
