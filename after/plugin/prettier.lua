local prettier = require("prettier")

prettier.setup({
    ["null-ls"] = {
        condition = function()
            return prettier.config_exists({
                check_package_json = true,
            })
        end,
        runtime_condition = function(params)
            return true
        end,
        timeout = 5000,
    },
    bin = 'prettierd', -- or `'prettierd'` (v0.22+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})
