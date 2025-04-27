local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'modus_vivendi'
  else
    return 'modus_operandi'
  end
end


-- Stying
config.color_scheme = scheme_for_appearance(get_appearance())
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 24,
  right = 24,
  top = 24,
  bottom = 24
};

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_thickness = "200%"

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.font = wezterm.font("Iosevka SS15")
config.font_size = 16.0

return config
