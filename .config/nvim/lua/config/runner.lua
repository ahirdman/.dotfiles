local M = {}

local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local TAIL_LINES = 12

--- @class RunnerOpts
--- @field cmd string
--- @field title string
--- @field id string
--- @field cwd? string
--- @field on_complete fun(output: string[], code: integer)

--- Run a command asynchronously with streaming notification output.
--- @param opts RunnerOpts
function M.run(opts)
	local output = {}
	local spinner_idx = 1
	local cwd = opts.cwd or vim.fn.getcwd()

	-- Show initial notification
	vim.notify("Starting...", vim.log.levels.INFO, {
		id = opts.id,
		title = opts.title,
		icon = spinner_frames[1],
		timeout = false,
	})

	--- Build the notification message from the tail of accumulated output
	local function build_msg()
		if #output == 0 then
			return "Running..."
		end

		local start = math.max(1, #output - TAIL_LINES + 1)
		local lines = {}
		for i = start, #output do
			table.insert(lines, output[i])
		end

		local msg = table.concat(lines, "\n")

		if #output > TAIL_LINES then
			msg = "... (" .. (#output - TAIL_LINES) .. " more lines)\n" .. msg
		end

		return msg
	end

	--- Update the notification in-place
	local function update_notification()
		vim.notify(build_msg(), vim.log.levels.INFO, {
			id = opts.id,
			title = opts.title,
			icon = spinner_frames[spinner_idx],
			timeout = false,
		})
	end

	-- Job chunks can end mid-line; hold the unfinished tail per stream.
	local partial = { stdout = "", stderr = "" }

	--- Process data chunks from stdout/stderr
	local function on_data(_, data, stream)
		if not data then
			return
		end

		local dirty = false
		data[1] = partial[stream] .. data[1]
		partial[stream] = table.remove(data)
		for _, line in ipairs(data) do
			if line ~= "" then
				table.insert(output, line)
				dirty = true
			end
		end

		if dirty then
			vim.schedule(update_notification)
		end
	end

	-- Spinner timer: rotate icon every 80ms
	local timer = vim.uv.new_timer()
	timer:start(
		80,
		80,
		vim.schedule_wrap(function()
			spinner_idx = (spinner_idx % #spinner_frames) + 1
			update_notification()
		end)
	)

	local job = vim.fn.jobstart(opts.cmd, {
		cwd = cwd,
		on_stdout = on_data,
		on_stderr = on_data,
		on_exit = function(_, code)
			-- Stop spinner
			timer:stop()
			timer:close()

			for _, stream in ipairs({ "stdout", "stderr" }) do
				if partial[stream] ~= "" then
					table.insert(output, partial[stream])
				end
			end

			vim.schedule(function()
				opts.on_complete(output, code)
			end)
		end,
	})

	if job <= 0 then
		timer:stop()
		timer:close()
		vim.notify("Could not start: " .. opts.cmd, vim.log.levels.ERROR, {
			id = opts.id,
			title = opts.title,
			timeout = 5000,
		})
	end
end

return M
