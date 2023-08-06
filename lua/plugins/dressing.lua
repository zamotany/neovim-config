local utils = require("core.utils")

local options = {
  input = {
    enabled = false,
  },
  select = {
    get_config = function(opts)
      local config = {
        enabled = true,
        backend = {},
        trim_prompt = true,
        builtin = {
          border = utils.border("FloatBorder"),
          max_width = 0.8,
          min_width = 60,
          max_height = 0.8,
          min_height = 10,
          win_options = {
            winblend = 0,
          },
          relative = "editor",
          override = function(conf)
            if opts.kind == "codeaction" then
              conf.anchor = "SW"
              conf.col = 0
              conf.row = vim.api.nvim_win_get_height(0) + 1
              conf.width = vim.api.nvim_win_get_width(0)
              conf.border = utils.border("CodeActionBorder")
              conf.title_pos = "left"
            else
              conf.title = " " .. conf.title .. " "
            end

            return conf
          end,
        },
      }

      if opts.kind == "codeaction" then
        config.builtin.min_height = 1
      end

      return config
    end,
  },
}

return options
