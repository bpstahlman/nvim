return {
  'smoka7/hop.nvim',
  version = "*",
  event = "VeryLazy",
  cond = My_cfg.movement_plugin == "hop",
  opts = {
    -- TODO: Is this the default? If so, perhaps remove...
    --keys = 'etovxqpdygfblzhckisuran'
  },
	-- Note: LSP seems not to understand that requiring 'hop' sources hop.init.
	-- Note: LSP warns about missing fields in the objects passed to the varous hint_*
	-- functions, but this is harmless; the missing ones get defaults.
  keys = {
    -- HopLine
    { mode = { "n", "x", "o" }, '<A-j>',
			function() require'hop'.hint_lines{ direction = require'hop.hint'.HintDirection.AFTER_CURSOR } end,
      desc = "HopLine down" },
    { mode = { "n", "x", "o" }, '<A-k>',
			function() require'hop'.hint_lines{ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR } end,
      desc = "HopLine up"},
    -- HopWord
    { mode = { "n", "x", "o" }, '<A-w>',
			function() require'hop'.hint_words{ direction = require'hop.hint'.HintDirection.AFTER_CURSOR } end,
      desc = "HopWord forward" },
    { mode = { "n", "x", "o" }, '<A-b>',
			function() require'hop'.hint_words{ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR } end,
      desc = "HopWord forward" },
    -- HopChar1
    { mode = { "n", "x", "o" }, '<A-;>',
			function() require'hop'.hint_char1() end,
      desc = "HopChar1" },
    -- HopChar2
		-- Design Choice: Like sneak, leap, etc.
    { mode = { "n", "x", "o" }, 's',
			function() require'hop'.hint_char2() end,
      desc = "HopChar2" },
    { mode = { "n", "x", "o" }, 'gs',
			function() require'hop'.hint_char2{ multi_windows = true } end,
      desc = "HopChar2 multi-window" },
  }
}


-- vim:ts=2:sw=2:tw=90:noet:si
