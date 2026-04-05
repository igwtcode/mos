local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    --base00 = "{{colors.surface.default.hex}}", -- Default Background
    base00 = "NONE", -- Default Background
    --base01 = "NONE", -- Lighter Background (status bars)
    base01 = "{{colors.surface_container.default.hex}}", -- Lighter Background (status bars)
    base02 = "{{colors.surface_container_high.default.hex}}", -- Selection Background
    base03 = "{{colors.outline.default.hex}}", -- Comments, Invisibles
    -- Foreground tones
    base04 = "{{colors.on_surface_variant.default.hex}}", -- Dark Foreground (status bars)
    base05 = "{{colors.on_surface.default.hex}}", -- Default Foreground
    base06 = "{{colors.on_surface.default.hex}}", -- Light Foreground
    base07 = "{{colors.on_background.default.hex}}", -- Lightest Foreground
    -- Accent colors
    base08 = "{{colors.error.default.hex}}", -- Variables, XML Tags, Errors
    base09 = "{{colors.tertiary.default.hex}}", -- Integers, Constants
    base0A = "{{colors.secondary.default.hex}}", -- Classes, Search Background
    base0B = "{{colors.primary.default.hex}}", -- Strings, Diff Inserted
    base0C = "{{colors.tertiary_fixed_dim.default.hex}}", -- Regex, Escape Chars
    base0D = "{{colors.primary_fixed_dim.default.hex}}", -- Functions, Methods
    base0E = "{{colors.secondary_fixed_dim.default.hex}}", -- Keywords, Storage
    base0F = "{{colors.error_container.default.hex}}", -- Deprecated, Embedded Tags
  })

  local hl = vim.api.nvim_set_hl

  -- Solid background for floating/popup windows (Oil, LSP hover, etc.)
  local solid_bg = "{{colors.surface_container.default.hex}}"
  hl(0, "NormalFloat", { bg = solid_bg, fg = "{{colors.on_surface.default.hex}}" })
  hl(0, "FloatBorder", { bg = solid_bg, fg = "{{colors.outline.default.hex}}" })
  hl(0, "FloatTitle", { bg = solid_bg, fg = "{{colors.primary.default.hex}}" })
  hl(0, "MyHighlight", { bg = solid_bg, fg = "{{colors.on_surface.default.hex}}" })

  -- Transparent background for sidebar/tree panels (neo-tree)
  hl(0, "NeoTreeNormal", { bg = "NONE", fg = "{{colors.on_surface.default.hex}}" })
  hl(0, "NeoTreeNormalNC", { bg = "NONE", fg = "{{colors.on_surface.default.hex}}" })
  hl(0, "NeoTreeEndOfBuffer", { bg = "NONE", fg = "NONE" })
  hl(0, "NeoTreeWinSeparator", { bg = "NONE", fg = "{{colors.surface_container.default.hex}}" })

  -- Statusline base highlights
  hl(0, "StatusLine", { bg = "NONE", fg = "{{colors.on_surface.default.hex}}" })
  hl(0, "StatusLineNC", { bg = "NONE", fg = "{{colors.on_surface_variant.default.hex}}" })
end

function M.lualine_theme()
  local colors = {
    bg = "{{colors.surface_container.default.hex}}",
    fg = "{{colors.on_surface.default.hex}}",
    fg_dim = "{{colors.on_surface_variant.default.hex}}",
    primary = "{{colors.primary.default.hex}}",
    on_primary = "{{colors.on_primary.default.hex}}",
    secondary = "{{colors.secondary.default.hex}}",
    on_secondary = "{{colors.on_secondary.default.hex}}",
    tertiary = "{{colors.tertiary.default.hex}}",
    on_tertiary = "{{colors.on_tertiary.default.hex}}",
    error = "{{colors.error.default.hex}}",
    on_error = "{{colors.on_error.default.hex}}",
    command = "{{colors.primary_fixed_dim.default.hex}}",
  }

  return {
    normal = {
      a = { bg = colors.primary, fg = colors.on_primary, gui = "bold" },
      b = { bg = colors.bg, fg = colors.fg },
      c = { bg = "NONE", fg = colors.fg_dim },
    },
    insert = {
      a = { bg = colors.tertiary, fg = colors.on_tertiary, gui = "bold" },
      b = { bg = colors.bg, fg = colors.fg },
      c = { bg = "NONE", fg = colors.fg_dim },
    },
    visual = {
      a = { bg = colors.secondary, fg = colors.on_secondary, gui = "bold" },
      b = { bg = colors.bg, fg = colors.fg },
      c = { bg = "NONE", fg = colors.fg_dim },
    },
    replace = {
      a = { bg = colors.error, fg = colors.on_error, gui = "bold" },
      b = { bg = colors.bg, fg = colors.fg },
      c = { bg = "NONE", fg = colors.fg_dim },
    },
    command = {
      a = { bg = colors.command, fg = colors.on_primary, gui = "bold" },
      b = { bg = colors.bg, fg = colors.fg },
      c = { bg = "NONE", fg = colors.fg_dim },
    },
    inactive = {
      a = { bg = "NONE", fg = colors.fg_dim },
      b = { bg = "NONE", fg = colors.fg_dim },
      c = { bg = "NONE", fg = colors.fg_dim },
    },
  }
end

-- Register a signal handler for SIGUSR1 (theme updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["colors"] = nil
    require("colors").setup()
    local ok, lualine = pcall(require, "lualine")
    if ok then
      lualine.setup({ options = { theme = require("colors").lualine_theme() } })
    end
  end)
)

return M
