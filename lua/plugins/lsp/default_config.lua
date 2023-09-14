-- local capabilities = cmp_nvim_lsp.default_capabilities()

-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true,
-- }

local function default_config_builder()
    local opt = {
        -- capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        --- @param client lsp.Client
        ---@param bufnr integer
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            local opts = { buffer = event.buf, noremap = true, nowait = true }
            vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('i', '<c-f>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>aw', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', "<leader>,", vim.lsp.buf.code_action, opts)
            -- vim.keymap.set('n', '<leader>t', ':Trouble<cr>', opts)
            -- vim.keymap.set('n', '<leader>-', vim.diagnostic.goto_prev, opts)
            -- vim.keymap.set('n', '<leader>=', vim.diagnostic.goto_next, opts)
        end,
    }

    return opt
end

return default_config_builder
