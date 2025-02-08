return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require "dap"
			local ui = require "dapui"

			require("dapui").setup()
			require("nvim-dap-virtual-text").setup()

			-- try the following
			-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
			local c_debugger = vim.fn.exepath "gdb"
			if c_debugger ~= "" then
				dap.adapters.gdb = {
					id = 'gdb',
					type = 'executable',
					command = c_debugger,
					args = { '--quiet', '--interpreter=dap' },
				}

				dap.configurations.c = {
					{
						name = 'Run executable (GDB)',
						type = 'gdb',
						request = 'launch',
						program = function()
							local path = vim.fn.input({
								prompt = 'Path to executable: ',
								default = vim.fn.getcwd() .. '/',
								completion = 'file',
							})

							return (path and path ~= '') and path or dap.ABORT
						end,
					},
					{
						name = 'Run executable with arguments (GDB)',
						type = 'gdb',
						request = 'launch',
						program = function()
							local path = vim.fn.input({
								prompt = 'Path to executable: ',
								default = vim.fn.getcwd() .. '/',
								completion = 'file',
							})

							return (path and path ~= '') and path or dap.ABORT
						end,
						args = function()
							local args_str = vim.fn.input({
								prompt = 'Arguments: ',
							})
							return vim.split(args_str, ' +')
						end,
					},
					{
						name = 'Attach to process (GDB)',
						type = 'gdb',
						request = 'attach',
						processId = require('dap.utils').pick_process,
					},
				}

				dap.configurations.cpp = dap.configurations.c
				dap.configurations.rust = dap.configurations.c
			end

			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "[B]reakpoint" })
			vim.keymap.set("n", "<leader>di", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "[D]ap [I]f breakpoint" })
			vim.keymap.set("n", "<leader>dr", dap.clear_breakpoints, { desc = "[D]ap [R]eset breakpoint" })
			vim.keymap.set("n", "<leader>dl", function()
				dap.list_breakpoints()
				vim.cmd("copen")
			end, { desc = "[D]ap [L]ist breakpoint" })

			vim.keymap.set("n", "<leader>dt", function()
				require("dapui").toggle()
			end, { desc = "[D]ap ui [T]oggle" })
			vim.keymap.set("n", "<leader>dk", dap.terminate, { desc = "[D]ap [K]ill" })

			vim.keymap.set("n", "<F4>", dap.step_back, { desc = "Dap step_back" })
			vim.keymap.set("n", "<F5>", dap.restart, { desc = "Dap restart" })

			vim.keymap.set("n", "<F6>", dap.continue, { desc = "Dap continue" })
			vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Dap step_inot" })
			vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Dap step_over" })
			vim.keymap.set("n", "<F9>", dap.step_out, { desc = "Dap step_out" })
			vim.keymap.set("n", "<F10>", dap.run_to_cursor, { desc = "Dap run_to_cursor" })
			vim.keymap.set("n", "<leader>?", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Dap eval under cursor" })


			dap.listeners.before.attach.dapui_config           = function() ui.open() end
			dap.listeners.before.launch.dapui_config           = function() ui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
			dap.listeners.before.event_exited.dapui_config     = function() ui.close() end
		end,
	},
}
