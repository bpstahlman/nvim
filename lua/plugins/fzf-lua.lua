return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>h", function() require "fzf-lua".help_tags() end,
			mode = "n", desc = 'fzf-lua help tags' },

		-- Files
		-- TODO: Consider a distinct "Buffer" group that uses <leader>b for stuff like
		-- buffers(), blines(), etc...
		{ "<A-l>", function() require "fzf-lua".buffers() end,
      mode = "n", desc = 'buffers' },
		{ "<leader>fb", function() require "fzf-lua".buffers() end,
      mode = "n", desc = 'open buffers' },
		-- Shortcut: <A-f>
		{ "<A-f>", function() require "fzf-lua".files() end,
      mode = "n", desc = 'files' },
		{ "<leader>ff", function() require "fzf-lua".files() end,
      mode = "n", desc = 'files' },
		{ "<leader>fo", function() require "fzf-lua".oldfiles() end,
      mode = "n", desc = 'old files' },
		{ "<leader>fq", function() require "fzf-lua".quickfix() end,
      mode = "n", desc = 'quickfix list' },
		{ "<leader>fQ", function() require "fzf-lua".quickfix_stack() end,
      mode = "n", desc = 'quickfix stack' },
		{ "<leader>fl", function() require "fzf-lua".lines() end,
      mode = "n", desc = 'open buffers lines' },
		{ "<leader>fL", function() require "fzf-lua".blines() end,
      mode = "n", desc = 'current buffer lines' },
		{ "<leader>ft", function() require "fzf-lua".tabs() end,
      mode = "n", desc = 'open tabs' },
		-- Search
		{ "<A-s>", function() require "fzf-lua".grep() end,
      mode = "n", desc = 'search for pattern with grep or rg' },
		-- Shortcut: <A-*>
		{ "<A-*>", function() require "fzf-lua".grep_cword() end,
      mode = "n", desc = 'search word under cursor' },
		{ "<leader>sw", function() require "fzf-lua".grep_cword() end,
      mode = "n", desc = 'search word under cursor' },
		{ "<leader>sW", function() require "fzf-lua".grep_cWORD() end,
      mode = "n", desc = 'search WORD under cursor' },
		{ "<leader>sp", function() require "fzf-lua".grep_project() end,
      mode = "n", desc = "search all project lines (fzf.vim's :Rg)" },
		{ "<leader>sb", function() require "fzf-lua".lgrep_curbuf() end,
      mode = "n", desc = 'live grep the current buffer (defaults to regex)' },
		-- Shortcut: <A-r>
		{ "<A-r>", function() require "fzf-lua".live_grep_native() end,
      mode = "n", desc = 'performant version of live_grep' },
		{ "<leader>sr", function() require "fzf-lua".live_grep_native() end,
      mode = "n", desc = 'performant version of live_grep' },
		{ "<leader>s*", function() require "fzf-lua".live_grep_glob() end,
      mode = "n", desc = 'live grep with rg --glob support' },
		-- Tags / Treesitter
		{ "<leader>tt", function() require "fzf-lua".treesitter() end,
      mode = "n", desc = 'current buffer treesitter symbols' },
		{ "<leader>t]", function() require "fzf-lua".tags() end,
      mode = "n", desc = 'search project tags' },
		{ "<leader>tb", function() require "fzf-lua".btags() end,
      mode = "n", desc = 'search buffer tags' },
		{ "<leader>tg", function() require "fzf-lua".tags_grep() end,
      mode = "n", desc = 'search project tags' },
		{ "<leader>tw", function() require "fzf-lua".tags_grep_cword() end,
      mode = "n", desc = 'tags_grep word under cursor' },
		{ "<leader>tW", function() require "fzf-lua".tags_grep_cWORD() end,
      mode = "n", desc = 'tags_grep WORD under cursor' },
		{ "<leader>tl", function() require "fzf-lua".tags_live_grep() end,
      mode = "n", desc = 'live grep project tags' },
		-- LSP/Diagnostics
		{ "<leader>lr", function() require "fzf-lua".lsp_references() end,
      mode = "n", desc = 'References' },
		{ "<leader>ld", function() require "fzf-lua".lsp_definitions() end,
      mode = "n", desc = 'Definitions' },
		{ "<leader>lD", function() require "fzf-lua".lsp_declarations() end,
      mode = "n", desc = 'Declarations' },
		{ "<leader>lt", function() require "fzf-lua".lsp_typedefs() end,
      mode = "n", desc = 'Type Definitions' },
		{ "<leader>li", function() require "fzf-lua".lsp_implementations() end,
      mode = "n", desc = 'Implementations' },
		{ "<leader>ls", function() require "fzf-lua".lsp_document_symbols() end,
      mode = "n", desc = 'Document Symbols' },
		{ "<leader>lS", function() require "fzf-lua".lsp_workspace_symbols() end,
      mode = "n", desc = 'Workspace Symbols' },
		--{ "<leader>l?", function() require "fzf-lua".lsp_live_workspace_symbols() end,
    --  mode = "n", desc = 'Workspace Symbols (live query)' },
		{ "<leader>lc", function() require "fzf-lua".lsp_incoming_calls() end,
      mode = "n", desc = 'Incoming Calls' },
		{ "<leader>lC", function() require "fzf-lua".lsp_outgoing_calls() end,
      mode = "n", desc = 'Outgoing Calls' },
		{ "<leader>la", function() require "fzf-lua".lsp_code_actions() end,
      mode = "n", desc = 'Code Actions' },
		{ "<leader>lf", function() require "fzf-lua".lsp_finder() end,
      mode = "n", desc = 'All LSP locations, combined view' },
		--{ "<leader>l?d", function() require "fzf-lua".diagnostics_document() end,
    --  mode = "n", desc = 'Document Diagnostics' },
		--{ "<leader>l?D", function() require "fzf-lua".diagnostics_workspace() end,
    --  mode = "n", desc = 'Workspace Diagnostics' },
		--{ "<leader>lld", function() require "fzf-lua".lsp_document_diagnostics() end,
    --  mode = "n", desc = 'alias to diagnostics_document' },
		--{ "<leader>llD", function() require "fzf-lua".lsp_workspace_diagnostics() end,
    --  mode = "n", desc = 'alias to diagnostics_workspace' },
		-- Git
		-- Shortcut: <A-g>
		{ "<A-g>", function() require "fzf-lua".git_files() end,
      mode = "n", desc = 'git ls-files' },
		{ "<leader>gf", function() require "fzf-lua".git_files() end,
      mode = "n", desc = 'git ls-files' },
		{ "<leader>g?", function() require "fzf-lua".git_status() end,
      mode = "n", desc = 'git status' },
		{ "<leader>gl", function() require "fzf-lua".git_commits() end,
      mode = "n", desc = 'git commit log (project)' },
		{ "<leader>gb", function() require "fzf-lua".git_bcommits() end,
      mode = "n", desc = 'git commit log (buffer)' },
		{ "<leader>gp", function() require "fzf-lua".git_blame() end,
      mode = "n", desc = 'git blame (buffer)' },
		{ "<leader>gt", function() require "fzf-lua".git_tags() end,
      mode = "n", desc = 'git tags' },
		{ "<leader>gs", function() require "fzf-lua".git_stash() end,
      mode = "n", desc = 'git stash' },
		-- Miscellaneous
    { "<leader>v?r", function() require "fzf-lua".resume() end,
      mode = "n", desc = 'resume last command/query' },
    { "<leader>vb", function() require "fzf-lua".builtin() end,
      mode = "n", desc = 'fzf-lua builtin commands' },
    { "<leader>v?p", function() require "fzf-lua".profiles() end,
      mode = "n", desc = 'fzf-lua configuration profiles' },
    { "<leader>vh", function() require "fzf-lua".helptags() end,
      mode = "n", desc = 'help tags' },
    { "<leader>vK", function() require "fzf-lua".manpages() end,
      mode = "n", desc = 'man pages' },
    { "<leader>v?c", function() require "fzf-lua".colorschemes() end,
      mode = "n", desc = 'color schemes' },
    { "<leader>v?a", function() require "fzf-lua".awesome_colorschemes() end,
      mode = "n", desc = 'Awesome Neovim color schemes' },
    { "<leader>v?h", function() require "fzf-lua".highlights() end,
      mode = "n", desc = 'highlight groups' },
    { "<leader>vc", function() require "fzf-lua".commands() end,
      mode = "n", desc = 'neovim commands' },
    { "<leader>v:", function() require "fzf-lua".command_history() end,
      mode = "n", desc = 'command history' },
    { "<leader>v/", function() require "fzf-lua".search_history() end,
      mode = "n", desc = 'search history' },
    { "<leader>vm", function() require "fzf-lua".marks() end,
      mode = "n", desc = ':marks' },
    { "<leader>vj", function() require "fzf-lua".jumps() end,
      mode = "n", desc = ':jumps' },
    { "<leader>v;", function() require "fzf-lua".changes() end,
      mode = "n", desc = ':changes' },
    { "<leader>v\"", function() require "fzf-lua".registers() end,
      mode = "n", desc = ':registers' },
    { "<leader>v]", function() require "fzf-lua".tagstack() end,
      mode = "n", desc = ':tags' },
    { "<leader>va", function() require "fzf-lua".autocmds() end,
      mode = "n", desc = ':autocmd' },
    { "<leader>vk", function() require "fzf-lua".keymaps() end,
      mode = "n", desc = 'key mappings' },
    { "<leader>vf", function() require "fzf-lua".filetypes() end,
      mode = "n", desc = 'filetypes' },
    { "<leader>v?m", function() require "fzf-lua".menus() end,
      mode = "n", desc = 'menus' },
    { "<leader>v?s", function() require "fzf-lua".spell_suggest() end,
      mode = "n", desc = 'spelling suggestions' },
    { "<leader>v?p", function() require "fzf-lua".packadd() end,
      mode = "n", desc = ':packadd <package>' },
		-- Completion Functions
		{ "<A-x>p", function() require "fzf-lua".complete_path() end,
      mode = { "c", "i" }, desc = 'complete path under cursor (incl dirs)' },
		{ "<A-x>f", function() require "fzf-lua".complete_file() end,
      mode = "!", desc = 'complete file under cursor (excl dirs)' },
		{ "<A-x>l", function() require "fzf-lua".complete_line() end,
      mode = "!", desc = 'complete line (all open buffers)' },
		{ "<A-x>L", function() require "fzf-lua".complete_bline() end,
      mode = "!", desc = 'complete line (current buffer only)' },
	},
	opts = {
		-- MISC GLOBAL SETUP OPTIONS, SEE BELOW
		-- fzf_bin = ...,
		-- UI Options
		winopts = {
		},
		-- Neovim keymaps / fzf binds
		keymap = {
				-- Below are the default binds, setting any value in these tables will override
				-- the defaults, to inherit from the defaults change [1] from `false` to `true`
				-- TODO: Consider whether I should inherit defaults for builtin and fzf, given that
				-- there are many I don't use. Perhaps disable inherit and simply specify what I
				-- use...
				builtin = {
					-- neovim `:tmap` mappings for the fzf win
					true,        -- uncomment to inherit all the below in your custom config
					--["<M-Esc>"]     = "hide",     -- hide fzf-lua, `:FzfLua resume` to continue
					--["<F1>"]        = "toggle-help",
					--["<F2>"]        = "toggle-fullscreen",
					---- Only valid with the 'builtin' previewer
					--["<F3>"]        = "toggle-preview-wrap",
					--["<F4>"]        = "toggle-preview",
					---- Rotate preview clockwise/counter-clockwise
					--["<F5>"]        = "toggle-preview-ccw",
					--["<F6>"]        = "toggle-preview-cw",
					---- `ts-ctx` binds require `nvim-treesitter-context`
					--["<F7>"]        = "toggle-preview-ts-ctx",
					--["<F8>"]        = "preview-ts-ctx-dec",
					--["<F9>"]        = "preview-ts-ctx-inc",
					--["<S-Left>"]    = "preview-reset",
					--["<S-down>"]    = "preview-page-down",
					--["<S-up>"]      = "preview-page-up",
					["<M-j>"] = "preview-down",
					["<M-k>"] = "preview-up",
				},
				fzf = {
					-- fzf '--bind=' options
					true,        -- uncomment to inherit all the below in your custom config
					--["ctrl-z"]      = "abort",
					--["ctrl-u"]      = "unix-line-discard",
					--["ctrl-f"]      = "half-page-down",
					--["ctrl-b"]      = "half-page-up",
					--["ctrl-a"]      = "beginning-of-line",
					--["ctrl-e"]      = "end-of-line",
					--["alt-a"]       = "toggle-all",
					--["alt-g"]       = "first",
					--["alt-G"]       = "last",
					---- Only valid with fzf previewers (bat/cat/git/etc)
					--["f3"]          = "toggle-preview-wrap",
					--["f4"]          = "toggle-preview",
					--["shift-down"]  = "preview-page-down",
					--["shift-up"]    = "preview-page-up",
				},
		},
		-- Fzf "accept" binds
		actions = {
				-- Below are the default actions, setting any value in these tables will override
				-- the defaults, to inherit from the defaults change [1] from `false` to `true`
				files = {
					true,        -- uncomment to inherit all the below in your custom config
					-- Pickers inheriting these actions:
					--   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
					--   tags, btags, args, buffers, tabs, lines, blines
					-- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
					-- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
					-- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
					--["enter"]       = actions.file_edit_or_qf,
					-- ctrl-x is more intuitive than ctrl-s.
					-- Caveat: file_split() takes args, which we must forward to avoid error.
					["ctrl-x"]      = function(...) require'fzf-lua.actions'.file_split(...) end,
					--["ctrl-v"]      = actions.file_vsplit,
					--["ctrl-t"]      = actions.file_tabedit,
					--["alt-q"]       = actions.file_sel_to_qf,
					--["alt-Q"]       = actions.file_sel_to_ll,
				},
		},
		-- Fzf CLI flags
		fzf_opts = {},
		-- Fzf `--color` specification
		fzf_colors = {},
		-- Highlights
		hls = {},
		-- Previewers options
		previewers = {},
		-- SPECIFIC COMMAND/PICKER OPTIONS, SEE BELOW
		files = {},
	}
}

-- vim:ts=2:sw=2:tw=90:noet:si
