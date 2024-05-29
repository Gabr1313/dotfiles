return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    opts = {
      handlers = {},
      -- ensure_installed = {
      --   "codelldb"
      -- }
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"
      local dapvt = require "nvim-dap-virtual-text"

      ui.setup()
      dapvt.setup({
        virt_text_pos = 'eol',
      })

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      sign("DapBreakpointCondition", { text = "󱄶", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      sign("DapLogPoint", { text = "󱜾", texthl = "DapLogPoint", linehl = "", numhl = "" })
      sign('DapStopped', { text = "", texthl = "DapStopped", linehl = "DiffDelete", numhl = "" })

      vim.keymap.set("n", "<leader>ds", dap.toggle_breakpoint, { desc = "[D]ebug [S]top (breakpoint)" })
      vim.keymap.set("n", "<leader>dh", dap.run_to_cursor, { desc = "[D]ebug stop [H]ere" })
      vim.keymap.set("n", "<leader>di", function() require("dapui").eval(nil, { enter = true }) end,
        { desc = "[D]ebug under cursor" })
      vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "[D]ebug [Q]uit" })
      vim.keymap.set("n", "<leader>dj", dap.continue, { desc = "[D]ebug next" })
      vim.keymap.set("n", "<leader>dk", dap.step_back, { desc = "[D]ebug previous" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug [I]nto" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug [O]ver" })
      vim.keymap.set("n", "<leader>df", dap.step_out, { desc = "[D]ebug out [F]unction" })
      vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "[D]ebug [R]estart" })
      vim.keymap.set("n", "<leader>dc", function() dap.set_breakpoint(vim.fn.input('Condition: ')) end,
        { desc = "[D]ebug [C]ondition (breakpoint)" })
      vim.keymap.set("n", "<leader>dm", function() dap.set_breakpoint(nil, nil, vim.fn.input('Message: ')) end,
        { desc = "[D]ebug [M]essage" })
      vim.keymap.set("n", "<leader>dt", ui.toggle, { desc = "[D]ebug ui [T]oggle" })
      vim.keymap.set("n", "<leader>du", function() ui.open({ reset = true }) end, { desc = "[D]ebug [U]i reset" })

      dap.listeners.before.attach.dapui_config = function() ui.open() end
      dap.listeners.before.launch.dapui_config = function() ui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
      dap.listeners.before.event_exited.dapui_config = function() ui.close() end

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }
      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
          terminal = 'integrated',
          -- args = function()
          --   local argument_string = vim.fn.input('Args: ')
          --   return argument_string
          -- end,
        },
      }
      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
      --[[ local codelldb_root = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/"
      local codelldb_path = codelldb_root .. "adapter/codelldb"
      local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args = { "--liblldb", liblldb_path, "--port", "${port}"},
        },
      }
      dap.configurations.c = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          terminal = 'integrated',
          -- args = function()
          --   local argument_string = vim.fn.input('Args: ')
          --   return vim.fn.split(argument_string, " ", true)
          -- end,
        },
      }
      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c ]]
    end,
  },
}
