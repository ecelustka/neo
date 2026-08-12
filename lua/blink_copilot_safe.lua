-- Wraps blink-cmp-copilot to avoid "attempt to index local 'client' (a nil value)"
-- when the copilot LSP client is stopped (:Copilot disable) or not yet started.
local M = {}

local function empty(callback)
	callback({
		is_incomplete_forward = false,
		is_incomplete_backward = false,
		items = {},
	})
end

function M:new()
	local base = require("blink-cmp-copilot")
	local instance = base:new()
	local base_get_completions = instance.get_completions

	instance.get_completions = function(self, context, callback)
		-- enabled() refreshes the cached client; bail out instead of
		-- letting the request hit a nil client
		if vim.g.copilot_enabled == false or not self:enabled() then
			return empty(callback)
		end
		local ok, err = pcall(base_get_completions, self, context, callback)
		if not ok then
			vim.schedule(function()
				vim.notify("copilot completion failed: " .. tostring(err), vim.log.levels.DEBUG)
			end)
			return empty(callback)
		end
	end

	return instance
end

return M
