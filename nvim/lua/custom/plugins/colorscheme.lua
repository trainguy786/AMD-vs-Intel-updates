return {
  'folke/tokyonight.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {},
  config = function()

  	require('tokyonight').setup({
    -- use the night style
    	style = 'night',
    	light_style = 'day', -- The theme is used when the background is set to light
    	transparent = true, -- Enable this to disable setting the background color
    	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    -- disable italic for functions
    	styles = {
      		functions = {},
    		},
    	cache = true, -- When set to true, the theme will be cached for better performance
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    	on_colors = function(colors)
      	colors.hint = colors.orange
      	colors.error = '#ff0000'
    	end,
	})
vim.cmd [[colorscheme tokyonight]]
end,
}
