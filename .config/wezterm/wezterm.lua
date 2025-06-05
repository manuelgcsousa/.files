local wezterm = require("wezterm")
local config = wezterm.config_builder()
local is_linux = wezterm.target_triple:find("linux") ~= nil

--
-- ASPECT & COLORS
--

config.enable_tab_bar = false

config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}

config.colors = {
  background = "#181818",
  foreground = "#d4d4d3",
  cursor_bg = "#cccccc",

  ansi = {
    "black",
    "#eb4129",
    "#abe047",
    "#f6c744",
    "#47a0f3",
    "#7b5cb0",
    "#64dbed",
    "silver",
  },

  brights = {
    "grey",
    "#ec5357",
    "#c0e17d",
    "#f9da6a",
    "#49a4f8",
    "#a47de9",
    "#99faf2",
    "white",
  },
}

config.font = wezterm.font(
  {
    family = "Iosevka Nerd Font",
    weight = "Regular",
    harfbuzz_features = { "calt=0" }
  }
)
config.font_size = is_linux and 12 or 16
config.line_height = 1.2
config.front_end = "WebGpu"


--
-- MAPPINGS
--

config.disable_default_key_bindings = true

if is_linux then
  config.keys = {
    { key = "r", mods = "CTRL|SHIFT", action = wezterm.action.ReloadConfiguration },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "+", mods = "CTRL",       action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CTRL",       action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CTRL",       action = wezterm.action.ResetFontSize },
  }
else
  config.send_composed_key_when_left_alt_is_pressed = true
  config.send_composed_key_when_right_alt_is_pressed = true

  config.keys = {
    { key = "r", mods = "SUPER", action = wezterm.action.ReloadConfiguration },
    { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
    { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "+", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize },
    { key = "w", mods = "CMD",   action = wezterm.action.CloseCurrentTab({ confirm = true }) },
    { key = "q", mods = "CMD",   action = wezterm.action.QuitApplication },
  }
end

return config
