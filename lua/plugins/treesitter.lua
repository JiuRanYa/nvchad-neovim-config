
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
    opts  = {
			ensure_installed = { "javascript", "html", "json"},
      -- 启用代码缩进模块 (=)
      indent = {
        enable = true,
      },
    }
	},
  {
    'windwp/nvim-ts-autotag',
    event = "VeryLazy",
    config = function ()
      -- code
      require('nvim-ts-autotag').setup({})
    end
  }
}
