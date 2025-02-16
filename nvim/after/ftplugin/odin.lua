local program_output = {}
local message = ""

local function analize_output(_, exit_code)
	if exit_code == 0 then
		message = message .. " --- SUCCESSFUL"
	else
		message = message .. " --- FAILED"

		local result = {}
		for _, line in ipairs(program_output) do
			if #line > 0 then
				local x = line:gsub("\t", "    ")
				table.insert(result, x)
			end
		end
		result = table.concat(result, "\n")
		-- result = table.concat(program_output, "\n")


		vim.fn.setqflist({}, " ", {
			lines = vim.split(result, "\n"),
			-- :h error-file-format
			efm = "%A%f(%l:%c)%m"
		})
	end

	vim.notify(message)
	vim.cmd("cw")
	if vim.bo.buftype == "quickfix" then
		vim.cmd("wincmd p")
	end
end

local job_opts = {
	stdout_buffered = true,
	stderr_buffered = true,
	on_stderr = function(_, data)
		program_output = data
	end,
	on_stdout = function(_, data)
		assert(#data == 1 and #data[1] == 0)
	end,
	on_exit = analize_output,
}

local function write_ane_execute(cmd)
	program_output = {}
	message = ""
	vim.cmd("write")
	message = "$ " .. cmd
	vim.fn.jobstart(cmd, job_opts)
end

local function odin_build_file(opts)
	vim.cmd("write")
	program_output = {}
	cmd = "odin build " .. vim.fn.expand("%") .. " -file " .. opts.args
	message = "$ " .. cmd
	vim.fn.jobstart(cmd, job_opts)
end

local function odin_build(opts)
	vim.cmd("write")
	program_output = {}
	cmd = "odin build . " .. opts.args
	message = "$ " .. cmd
	vim.fn.jobstart(cmd, job_opts)
end

vim.api.nvim_create_user_command("OdinBuildFile", odin_build_file, { nargs = "*" })
vim.keymap.set("n", "<leader>of", "<cmd>OdinBuildFile -debug -sanitize:address<CR>", { desc = "[O]din Debug [F]ile" })

vim.api.nvim_create_user_command("OdinBuild", odin_build, { nargs = "*" })
vim.keymap.set("n", "<leader>od", "<cmd>OdinBuild -debug<CR>", { desc = "[O]din [D]ebug" })
