
local M = {}
-- Map of fp's keyed by name
local fps = {}


-- Return cached or newly-created fp corresponding to name.
function M.get(name)
  local name = vim.fs.joinpath(vim.fn.stdpath('data'), vim.fn.printf("%s-debug.log", name))
  if not fps[name] then
    -- Ignore warning: stdpath('data') returns scalar.
    -- TODO: Create subdir?
    local fp, err = io.open(name, "w")
    if not fp then
      -- Ignore warning: LSP is confused.
      vim.notify(vim.fn.printf("Error opening logfile %s: %s", name, err), vim.log.levels.WARN)
      return nil
    end
    fps[name] = fp
    print(fp, fps[name])
  end
  return fps[name]
end

return M
