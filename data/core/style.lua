local common = require "core.common"
local style = {}

style.divider_size = common.round(1 * SCALE)
style.scrollbar_size = common.round(4 * SCALE)
style.expanded_scrollbar_size = common.round(12 * SCALE)
style.minimum_thumb_size = common.round(20 * SCALE)
style.contracted_scrollbar_margin = common.round(8 * SCALE)
style.expanded_scrollbar_margin = common.round(12 * SCALE)
style.caret_width = common.round(2 * SCALE)
style.tab_width = common.round(170 * SCALE)

style.padding = {
  x = common.round(14 * SCALE),
  y = common.round(7 * SCALE),
}

style.margin = {
  tab = {
    top = common.round(-style.divider_size * SCALE)
  }
}

-- The function renderer.font.load can accept an option table as a second optional argument.
-- It shoud be like the following:
--
-- {antialiasing= "grayscale", hinting = "full"}
--
-- The possible values for each option are:
-- - for antialiasing: grayscale, subpixel
-- - for hinting: none, slight, full
--
-- The defaults values are antialiasing subpixel and hinting slight for optimal visualization
-- on ordinary LCD monitor with RGB patterns.
--
-- On High DPI monitor or non RGB monitor you may consider using antialiasing grayscale instead.
-- The antialiasing grayscale with full hinting is interesting for crisp font rendering.
style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", 15 * SCALE)
style.big_font = style.font:copy(46 * SCALE)
style.icon_font = renderer.font.load(DATADIR .. "/fonts/icons.ttf", 16 * SCALE, {antialiasing="grayscale", hinting="full"})
style.icon_big_font = style.icon_font:copy(23 * SCALE)
style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 15 * SCALE)

style.syntax = {}

-- This can be used to override fonts per syntax group.
-- The syntax highlighter will take existing values from this table and
-- override style.code_font on a per-token basis, so you can choose to eg.
-- render comments in an italic font if you want to.
style.syntax_fonts = {}
-- style.syntax_fonts["comment"] = renderer.font.load(path_to_font, size_of_font, rendering_options)

-- Optional UI colors. These are only used when a theme defines them.
-- Fallbacks are provided by the widgets that consume them, so older
-- themes that do not define these fields keep their previous look.

-- Tab strip (the area behind the open tabs).
style.tab_strip_background = style.background2
-- Inactive (non-selected) tab background.
style.tab_background = style.background2
-- Active (selected) tab background. In VSCode-like themes this is the
-- same as the editor background so that the tab appears "attached" to it.
style.tab_active_background = style.background
-- Top accent bar drawn on the active tab.
style.tab_active_border = style.accent
style.tab_active_border_width = common.round(2 * SCALE)
-- Subtle bar shown on hovered, non-active tabs.
style.tab_hover_border = style.divider
style.tab_hover_border_width = common.round(1 * SCALE)
-- Text colors used inside tabs.
style.tab_text = style.dim
style.tab_active_text = style.text

-- Title bar background.
style.titlebar_background = style.background2

-- Status bar background and text. A theme may give the status bar a
-- distinct look (e.g. the VSCode blue bar).
style.statusbar_background = style.background2
style.statusbar_text = style.text
style.statusbar_dim = style.dim

-- Quick input / command palette (VSCode-like).
style.quickinput_background = style.background3
style.quickinput_text = style.text
style.quickinput_text_info = style.dim
style.quickinput_selected_background = style.line_highlight
style.quickinput_selected_text = style.text

-- Sidebar section header (the "EXPLORER" header of the treeview).
style.sidebar_header_background = style.background2
style.sidebar_header_text = style.dim

-- Activity bar (the vertical icon column on the far left).
style.activitybar_background = style.background2
style.activitybar_text = style.accent
style.activitybar_inactive_text = style.dim
style.activitybar_active_border = style.accent
style.activitybar_active_border_width = common.round(2 * SCALE)

style.log = {}

return style
