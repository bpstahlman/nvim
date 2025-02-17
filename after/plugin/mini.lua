-- Load some mini plugins.

-- Quickly move line or visual selection left/down/up/right with <A-h/j/k/l> maps.
require'mini.move'.setup{
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl, but I want to
    -- keep the Meta mappings for more frequently used stuff.
    -- TODO: Would this be good use case for a hydra?
    left = '<C-h>',
    right = '<C-l>',
    down = '<C-j>',
    up = '<C-k>',

    -- Move current line in Normal mode
    line_left = '<C-h>',
    line_right = '<C-l>',
    line_down = '<C-j>',
    line_up = '<C-k>',
  },

  -- Options which control moving behavior
  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
}
-- Note: Plugins like which-key want this, but will load it themselves.
--require'mini.icons'.setup()

-- vim:ts=2:sw=2:tw=90:et:si
