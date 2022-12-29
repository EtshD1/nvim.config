local status, nullLs = pcall(require, "null-ls")
if not status then
    print("null-ls not found")
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
nullLs.setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})

vim.keymap.set('n', '<leader>p', vim.lsp.buf.format)
