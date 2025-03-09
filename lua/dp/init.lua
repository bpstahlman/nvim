-- TODO: Clean this up and add configurability.
local M = {}
-- Get table mapping names to fps.
local fpmap = require'dp.fpmap'

local default_opts = {
  -- TODO... Options besides name? Perhaps allow param to be string|table
}

function M:get(name, opts)
  name = name or "dbglog"
  opts = opts or {}
  local o = {
    name = name,
    opts = vim.tbl_deep_extend('force', default_opts, opts),
  }
  self.__index = self
  return setmetatable(o, self)
end

function M:logf(fmt, ...)
  local fp = assert(fpmap.get(self.name))
  fp:write(vim.fn.printf(fmt .. "\n", ...))
  fp:flush()
end

function M:logi(...)
  local fp = assert(fpmap.get(self.name))
  fp:write(vim.fn.join(vim.tbl_map(
    function (x) return type(x) == "string" and x or vim.inspect(x) end, {...}), ' ') .. "\n")
  fp:flush()
end

return M

-- vim:ts=2:sw=2:tw=90:et:si
