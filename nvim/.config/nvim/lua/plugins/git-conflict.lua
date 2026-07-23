-- return {'akinsho/git-conflict.nvim', version = "*", config = true}
return {
  'akinsho/git-conflict.nvim',
  version = "*",
  config = {
    list_opener = 'copen', -- command or function to open the conflicts list
    highlights = { -- They must have background color, otherwise the default color will be used
      incoming = 'DiffAdd',
      current = 'DiffText',
    }
  }
}
