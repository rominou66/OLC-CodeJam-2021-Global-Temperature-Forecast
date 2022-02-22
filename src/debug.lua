local debug = {}

debug_flag = false

function debug_draw()
  if debug_flag == true then
    mem = collectgarbage('count')
    stats = love.graphics.getStats(stats)

    love.graphics.setFont(font8, 4)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("FPS: "..love.timer.getFPS(),                             5, 5)
    love.graphics.print("DT: "..math.floor(love.timer.getDelta() * 1000),         5, 15)
    love.graphics.print("Memory:"..math.floor(mem * 10) / 100,                    5, 25)
    love.graphics.print("Drawcalls:"..stats.drawcalls,                            5, 35)
    love.graphics.print("Texture Mem:"..math.floor(stats.texturememory) / 100,    5, 45)
    love.graphics.print("pixelX: "..math.floor(tostring(back_1_map_x)),           5, 55)
    love.graphics.print("tileX: "..math.floor(tostring((back_1_map_x /64)+1)),    5, 65)
    love.graphics.print("tileX_2: "..math.floor(tostring((back_2_map_x /64)+1)),  5, 75)
    love.graphics.print("tileX_3: "..math.floor(tostring((back_3_map_x /64)+1)),  5, 85)
  end
end

return debug