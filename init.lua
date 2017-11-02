-- Author: François de Metz

local awful        = require("awful")
local naughty      = require("naughty")
local beautiful    = require("beautiful")
local wibox        = require("wibox")
local gears        = require("gears")

-- 25 min
local pomodoro_time = 60 * 25

local pomodoro_image_path = beautiful.pomodoro_icon or awful.util.getdir("config") .."/pomodoro/pomodoro.png"

-- setup widget
local pomodoro = wibox.widget({
      image = pomodoro_image_path,
      widget = wibox.widget.imagebox
})

-- setup timers
local pomodoro_timer         = gears.timer({ timeout = pomodoro_time })
local pomodoro_tooltip_timer = gears.timer({ timeout = 1 })
local pomodoro_nbsec         = 0

local function pomodoro_start()
    pomodoro_timer:start()
    pomodoro_tooltip_timer:start()
    pomodoro.bg = beautiful.bg_normal
 end

local function pomodoro_stop()
   pomodoro_timer:stop(pomodoro_timer)
   pomodoro_tooltip_timer:stop(pomodoro_tooltip_timer)
   pomodoro_nbsec = 0
end

local function pomodoro_end()
    pomodoro_stop()
    pomodoro.bg = beautiful.bg_urgent
end

local function pomodoro_notify(text)
   naughty.notify({ title = "Pomodoro", text = text, timeout = 10,
                    icon = pomodoro_image_path, icon_size = 64,
                    width = 200
                 })
end

pomodoro_timer:connect_signal("timeout",
                          function(c)
                             pomodoro_end()
                             pomodoro_notify('Ended')
                          end)

pomodoro_tooltip_timer:connect_signal("timeout",
                                  function(c)
                                     pomodoro_nbsec = pomodoro_nbsec + 1
                                  end)

pomodoro_tooltip = awful.tooltip({
                                    objects = { pomodoro },
                                    timer_function = function()
                                                        if pomodoro_timer.started then
                                                           r = (pomodoro_time - pomodoro_nbsec) % 60
                                                           return 'End in ' .. math.floor((pomodoro_time - pomodoro_nbsec) / 60) .. ' min ' .. r
                                                        else
                                                           return 'pomodoro not started'
                                                        end
                                                     end,
})

local function pomodoro_start_timer()
   if not pomodoro_timer.started then
      pomodoro_start()
      pomodoro_notify('Started')
   else
      pomodoro_stop()
      pomodoro_notify('Canceled')
   end
end

pomodoro:buttons(awful.util.table.join(
                    awful.button({ }, 1, pomodoro_start_timer)
              ))

return pomodoro
