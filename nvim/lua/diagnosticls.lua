local M = {}
M.on_attach = function()
  -- require"lspconfig".diagnosticls.setup {
  lspconfig.diagosticls.setup {
    on_attach = on_attach,
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
  init_options = {
    linters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        rootPatterns = {".git", ".eslintrc.cjs", ".eslintrc", ".eslintrc.json", ".eslintrc.js"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
      filetypes = {
        javascript = "eslint",
        javascriptreact = "eslint",
        typescript = "eslint",
        typescriptreact = "eslint",
        ["typescript.tsx"] = "eslint"
      }
    }
}
}
end
return M
