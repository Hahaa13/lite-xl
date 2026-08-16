local style = require "core.style"
local common = require "core.common"

-- VSCode Dark+ inspired color scheme.
-- It uses the regular Lite XL theme system: each field below is the
-- same `style` field consumed by the core widgets and by plugins.

-- Editor / base colors
style.background = { common.color "#1e1e1e" }   -- Editor
style.background2 = { common.color "#252526" }  -- Sidebar / tab strip
style.background3 = { common.color "#252526" }  -- Command palette
style.text = { common.color "#cccccc" }
style.caret = { common.color "#aeafad" }
style.accent = { common.color "#ffffff" }
style.dim = { common.color "#7f7f7f" }
style.divider = { common.color "#3c3c3c" }
style.selection = { common.color "#264f78" }
style.line_number = { common.color "#858585" }
style.line_number2 = { common.color "#c6c6c6" }
style.line_highlight = { common.color "#2a2a2a" }
style.scrollbar = { common.color "#424242" }
style.scrollbar2 = { common.color "#6e6e6e" }
style.scrollbar_track = { common.color "#1e1e1e" }
style.nagbar = { common.color "#f48771" }
style.nagbar_text = { common.color "#1e1e1e" }
style.nagbar_dim = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255, 255, 255, 0.1)" }
style.drag_overlay_tab = { common.color "#0078d4" }
style.good = { common.color "#89d185" }
style.warn = { common.color "#cca700" }
style.error = { common.color "#f48771" }
style.modified = { common.color "#0078d4" }

-- Tab strip
style.margin.tab.top = 0
style.tab_strip_background = { common.color "#252526" }
style.tab_background = { common.color "#2d2d2d" }
style.tab_active_background = { common.color "#1e1e1e" }
style.tab_active_border = { common.color "#0078d4" }
style.tab_active_border_width = common.round(2 * SCALE)
style.tab_hover_border = { common.color "#2a2d2e" }
style.tab_hover_border_width = common.round(1 * SCALE)
style.tab_text = { common.color "#969696" }
style.tab_active_text = { common.color "#ffffff" }

-- Title bar
style.titlebar_background = { common.color "#3c3c3c" }

-- Status bar
style.statusbar_background = { common.color "#0078d4" }
style.statusbar_text = { common.color "#ffffff" }
style.statusbar_dim = { common.color "rgba(255, 255, 255, 0.8)" }

-- Sidebar section header
style.sidebar_header_background = { common.color "#00000033" }
style.sidebar_header_text = { common.color "#cccccc" }

-- Activity bar
style.activitybar_background = { common.color "#333333" }
style.activitybar_text = { common.color "#ffffff" }
style.activitybar_inactive_text = { common.color "#858585" }
style.activitybar_active_border = { common.color "#ffffff" }
style.activitybar_active_border_width = common.round(2 * SCALE)

-- Quick input / command palette
style.quickinput_background = { common.color "#252526" }
style.quickinput_text = { common.color "#cccccc" }
style.quickinput_text_info = { common.color "#9d9d9d" }
style.quickinput_selected_background = { common.color "#04395e" }
style.quickinput_selected_text = { common.color "#ffffff" }

-- Syntax colors (VSCode Dark+ palette)
style.syntax["normal"] = { common.color "#d4d4d4" }
style.syntax["symbol"] = { common.color "#d4d4d4" }
style.syntax["comment"] = { common.color "#6a9955" }
style.syntax["keyword"] = { common.color "#569cd6" }
style.syntax["keyword2"] = { common.color "#4ec9b0" }
style.syntax["number"] = { common.color "#b5cea8" }
style.syntax["literal"] = { common.color "#569cd6" }
style.syntax["string"] = { common.color "#ce9178" }
style.syntax["operator"] = { common.color "#d4d4d4" }
style.syntax["function"] = { common.color "#dcdcaa" }

style.log["INFO"] = { icon = "i", color = style.statusbar_text }
style.log["WARN"] = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
