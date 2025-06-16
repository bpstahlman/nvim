return {
  "bpstahlman/nvim-treeclimber",
  cond = false,
  --enabled = false,
  --branch = "main",
  dir = "~/.config/nvim/pack/dkendal/opt/nvim-treeclimber",
  opts = {
    ui = {
      -- I prefer to keep lowercase alt commands for other things.
      keys = {
        select_current_node = {{"n", "<A-k>"}, {{"x", "o"}, "i."}},
        select_forward = "<A-L>",
        select_backward = "<A-H>",
        -- TODO: Introduce aliases for these two.
        select_first_sibling = "<A-[>",
        select_last_sibling = "<A-]>",
        select_shrink = "<A-J>",
        select_expand = {
          {{"x", "o"}, "a."},
          {{"n", "x", "o"}, "<A-K>"}
        },
        select_grow_forward = "<A-}>",
        select_grow_backward = "<A-{>",
        select_top_level = "<A-G>",
      },
      cmds = true,
    },
    display = {
      regions = {
        highlights = {
          --Parent = {italic = true},
          --Selection = {bold = true},
        },
        --replace_defaults = true,
        --inherit_attrs = false,
      }
    }
  }
}

-- vim:ts=2:sw=2:et:tw=90:ai:si
