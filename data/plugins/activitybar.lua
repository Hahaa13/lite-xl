-- mod-version:4
local core = require "core"
local common = require "core.common"
local command = require "core.command"
local config = require "core.config"
local keymap = require "core.keymap"
local style = require "core.style"
local View = require "core.view"

-- Allow disabling the activity bar from the user config.
if config.plugins.activitybar == false then
  return nil
end

config.plugins.activitybar = common.merge({
  -- Default width of the activity bar (px).
  size = 48 * SCALE,
  visible = true,
}, config.plugins.activitybar)

---A vertical icon column on the far left, similar to the VSCode activity bar.
---
---It is created by the treeview plugin and does not plug itself in the
---node layout, so it can be toggled or re-used freely.
---@class plugins.activitybar : core.view
---@field super core.view
local ActivityBar = View:extend()

function ActivityBar:__tostring() return "ActivityBar" end

function ActivityBar:new()
  ActivityBar.super.new(self)
  self.visible = config.plugins.activitybar.visible
  self.size.x = config.plugins.activitybar.size
  self.items = {
    { name = "explorer", symbol = "f", tooltip = "Explorer", command = "treeview:toggle" },
    { name = "search",   symbol = "L", tooltip = "Search",   command = "project-search:find" },
    { name = "command",  symbol = "B", tooltip = "Command Palette", command = "core:find-command" },
  }
  -- Map of item name -> predicate. When the predicate returns true the
  -- item is highlighted as "active" (like the open explorer in VSCode).
  self.active = {}
  self.hovered_item = nil
end

---Set a predicate that decides whether the given item is highlighted.
---@param name string
---@param predicate fun(): boolean
function ActivityBar:set_item_active(name, predicate)
  self.active[name] = predicate
end

function ActivityBar:update()
  local dest = self.visible and config.plugins.activitybar.size or 0
  if self.size.x ~= dest then
    self.size.x = dest
    core.redraw = true
  end
  ActivityBar.super.update(self)
end

---@param index integer
---@return number x, number y, number w, number h
function ActivityBar:get_item_rect(index)
  local ox, oy = self:get_content_offset()
  local s = self.size.x
  return ox, oy + s * (index - 1), s, s
end

---@param x number
---@param y number
---@return table?
function ActivityBar:get_item_for_point(x, y)
  for i, item in ipairs(self.items) do
    local ix, iy, iw, ih = self:get_item_rect(i)
    if x >= ix and y >= iy and x < ix + iw and y < iy + ih then
      return item
    end
  end
end

---@param item table
---@return boolean
function ActivityBar:item_is_active(item)
  local pred = self.active[item.name]
  return pred and pred() or false
end

function ActivityBar:on_mouse_moved(x, y, ...)
  ActivityBar.super.on_mouse_moved(self, x, y, ...)
  local item = self:get_item_for_point(x, y)
  if item ~= self.hovered_item then
    self.hovered_item = item
    if item then
      local binding = keymap.get_binding(item.command)
      core.status_view:show_tooltip(
        binding and { item.tooltip, style.dim, "  ", binding } or { item.tooltip }
      )
    else
      core.status_view:remove_tooltip()
    end
  end
end

function ActivityBar:on_mouse_left()
  ActivityBar.super.on_mouse_left(self)
  if self.hovered_item then
    core.status_view:remove_tooltip()
  end
  self.hovered_item = nil
end

function ActivityBar:on_mouse_pressed(button, x, y, clicks)
  if not self.visible or self.size.x <= 0 then return end
  local caught = ActivityBar.super.on_mouse_pressed(self, button, x, y, clicks)
  if caught then return caught end
  if button ~= "left" then return end
  local last = core.last_active_view
  if last and last ~= self then
    core.set_active_view(last)
  end
  local item = self:get_item_for_point(x, y)
  if item and command.is_valid(item.command) then
    command.perform(item.command)
  end
end
function ActivityBar:draw()
  if not self.visible or self.size.x <= 0 then return end
  self:draw_background(style.activitybar_background or style.background2)

  local icon_h, icon_w = style.icon_font:get_height(), style.icon_font:get_width("B")
  for i, item in ipairs(self.items) do
    local x, y, w, h = self:get_item_rect(i)
    local is_active = self:item_is_active(item)
    local is_hovered = item == self.hovered_item
    local color = (is_active or is_hovered)
      and (style.activitybar_text or style.accent)
      or (style.activitybar_inactive_text or style.dim)
    if is_active then
      local bw = style.activitybar_active_border_width or style.divider_size
      renderer.draw_rect(x, y, bw, h, style.activitybar_active_border or style.accent)
    end
    local tx = x + (w - icon_w) / 2
    local ty = y + (h - icon_h) / 2
    common.draw_text(style.icon_font, color, item.symbol, nil, tx, ty, 0, h)
  end
end

keymap.add {
  ["ctrl+b"] = "treeview:toggle",
}

return ActivityBar
