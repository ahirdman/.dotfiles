return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
            adapters = { "pwa-node" },
          })
        end,
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "js-debug-adapter" },
        automatic_installation = true,
      })

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end

      local wk = require("which-key")
      wk.register({
        d = {
          name = "Debug",
          b = { dap.toggle_breakpoint, "Breakpoint" },
          c = { dap.continue, "Continue" },
          i = { dap.step_into, "Step Into" },
          o = { dap.step_over, "Step Over" },
          O = { dap.step_out, "Step Out" },
          r = { dap.repl.toggle, "Toggle REPL" },
          l = { dap.run_last, "Run Last" },
          u = { dapui.toggle, "DAP UI" },
        },
      }, { prefix = "<leader>" })
    end,
  },
}
