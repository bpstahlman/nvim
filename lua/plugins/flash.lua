return {
  "folke/flash.nvim",
  -- TODO: Consider using init to set mappings.
  -- Ensure flash is loaded before keymaps are used; otherwise, normal
  -- search won't be integrated till after one of the mappings is used.
  --lazy = false,
  event = "VeryLazy",
  cond = My_cfg.movement_plugin == "flash",
  opts = {
    jump = {
      -- Note: After using it, I see why autojump is disabled by default: too easy
      -- to fail to stop typing when the jump occurs. Note, however, that you can
      -- hit Enter instead of the target char.
      autojump = false,
      -- Note: Works only if target label (not Enter) triggers jump.
      nohlsearch = true,
    },
    label = {
      rainbow = {
        enabled = true,
      },
      -- Note: You can actually set both after and before, which is kind of nice, as
      -- the target char delimits the match.
      -- Considerations: Both after and before can be set to either a boolean or a
      -- {row,col} offset. Default offset pair for after = {0,1}, before = {0,-1}.
      -- I've experimented with before = {0,0} to put the target on the first char
      -- in the match; the drawback is that my eye tends to follow the end of the
      -- match as it moves rightward. You can actually set both after and before,
      -- which is actually kind of nice, as the target char delimits the match.
      after = true,
      before = false,
    },
    search = {
      -- Empirical: Doesn't appear to impact normal search mode, which means (e.g.)
      -- I can't configure fuzzy search for normal search mode.
      -- TODO: Ask on list...
      -- Empirical: Meaning of 'incremental' is unclear: setting it here breaks f/F/t/T.
      -- TODO: Ask on list, providing example of breakage...
      incremental = true,
      -- TODO: Consider a hydra that switches between modes; similarly, consider
      -- hydra that switches f/F/t/T on/off and possibly one toggles normal search
      -- (though that could just be part of the first hydra).
      mode = "search",
    },
    modes = {
      -- Note: Don't let flash handle / and ?, at least not till I come up with a
      -- better mechanism for switching between normal and flash search.
      -- Rationale: Sometimes, you need to do a regular search to portions of the
      -- buffer unseen, and flash's search doesn't work for that.
      search = {
        -- Make / and ? use flash.
        enabled = true,
        jump = {
          nohlsearch = true,
        },
        search = {
          -- TODO: Settings here don't appear to have any effect. Docs seem to
          -- suggest the settings are hardcoded.
        },
      },
      char = {
        -- Take over f/t/F/T
        enabled = false,
        config = function(opts)
          -- TODO: Decide whether I like having the labels in operator-pending
          -- mode. Downside is that I often use f and t when the count is small
          -- (and obvious) and having to specify target in this case is
          -- annoying.
          -- Idea: Use labels unless there's a count or the first target is on
          -- the same line and within N chars (or < half a line away or some
          -- such heuristic)...
          opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
        end
      }
    },
  },
  keys = {
    -- Note: For now, I'm using unidirectional search (as opposed to the default setup
    -- that uses 'S' for treesitter) because bidirectional search has an annoying
    -- tendency to jump to off-screen targets. If I find a fix for this, consider
    -- going back to omnidirectional search.
    {
      mode = { "n", "x", "o" },
      's',
      function()
        require("flash").jump {
          search = { forward = true, wrap = false, multi_window = false } }
      end
    },
    {
      mode = { "n", "x", "o" },
      'S',
      function()
        require("flash").jump {
          search = { forward = false, wrap = false, multi_window = false } }
      end
    },
    {
      mode = { "n", "x", "o" },
      'gs',
      function()
        require("flash").jump {
          search = { multi_window = true } }
      end
    },
    { mode = { "n", "x", "o" }, '<A-t>', function() require("flash").treesitter() end },
    { mode = { "o" },           'r',     function() require("flash").remote() end },
    { mode = { "x", "o" },      'R',     function() require("flash").treesitter_search() end },
    -- Open floating diagnostic window for flash-selected line (without
    -- moving cursor).
    {
      mode = { "n" },
      '<A-d>',
      function()
        require("flash").jump {
          action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
              vim.api.nvim_win_set_cursor(match.win, match.pos)
              vim.diagnostic.open_float()
            end)
            state:restore()
          end,
        }
      end
    }
  },
}
-- vim:ts=2:sw=2:tw=90:et:si
