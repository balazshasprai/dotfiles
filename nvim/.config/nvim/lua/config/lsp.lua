local lspconfig = require('lspconfig')

-- Basic setup for yamlls (YAML language server)
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/gitlab-ci.json"] = "/.gitlab-ci.yml",
      },
      validate = true,
      completion = true,
      hover = true,
    },
  },
})

