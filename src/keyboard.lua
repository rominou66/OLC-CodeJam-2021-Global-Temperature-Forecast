local keyp = {}

local prevdt = 0
local currdt = {}
local timedt = {}

function check_escape()
  --check if escape is pressed to close the application
    if love.keyboard.isDown("escape") then
        love.event.push('quit')
    end
end

function check_debug()
  --check if f4 is pressed to show debug info
    currdt = love.timer.getDelta()
    timedt = currdt + prevdt
    --debounce logic
    if (timedt > 0.25) and love.keyboard.isDown("f4") then
      if debug_flag == false then
        debug_flag = true
  
      elseif debug_flag == true then
        debug_flag = false
      end
      timedt = 0
    end
    prevdt = timedt
  end

  function check_debug_skip()
    --move back one to 2019
    currdt = love.timer.getDelta()
    timedt = currdt + prevdt
  
    if (timedt > 0.25) and love.keyboard.isDown("f3") then
      back_1_map_x = 12900
      timedt = 0
    end
    prevdt = timedt
  end

  function player_movement(dt)
    --set the background speed
    local speed = 300 * dt
    if love.keyboard.isDown("a")  then
      back_1_map_x = back_1_map_x - speed
      back_2_map_x = back_2_map_x - (speed / 2)
      back_3_map_x = back_3_map_x - (speed / 4)
    end
    if love.keyboard.isDown("d")  then
      back_1_map_x = back_1_map_x + speed
      back_2_map_x = back_2_map_x + (speed / 2)
      back_3_map_x = back_3_map_x + (speed / 4)
    end
  end_map()
  end

  --check boundaries restrict movement
function end_map()
  if back_1_map_x < 0 then
    back_1_map_x = 0
  end
  
  if back_1_map_y < 0 then
    back_1_map_y = 0
  end	
  
  if back_1_map_x > back_1_map_w * tile_w - map_display_w * tile_w - 1 then
    back_1_map_x = back_1_map_w * tile_w - map_display_w * tile_w - 1
  end
  
  if back_1_map_y > map_h * tile_h - map_display_h * tile_h - 1 then
    back_1_map_y = map_h * tile_h - map_display_h * tile_h - 1
  end

  if back_2_map_x < 0 then
    back_2_map_x = 0
  end
  
  if back_2_map_y < 0 then
    back_2_map_y = 0
  end	
  
  if back_2_map_x > back_2_map_w * tile_w - map_display_w * tile_w - 1 then
    back_2_map_x = back_2_map_w * tile_w - map_display_w * tile_w - 1
  end
  
  if back_2_map_y > map_h * tile_h - map_display_h * tile_h - 1 then
    back_2_map_y = map_h * tile_h - map_display_h * tile_h - 1
  end

  if back_3_map_x < 0 then
    back_3_map_x = 0
  end
  
  if back_3_map_y < 0 then
    back_3_map_y = 0
  end	
  
  if back_3_map_x > back_3_map_w * tile_w - map_display_w * tile_w - 1 then
    back_3_map_x = back_3_map_w * tile_w - map_display_w * tile_w - 1
  end
  
  if back_3_map_y > map_h * tile_h - map_display_h * tile_h - 1 then
    back_3_map_y = map_h * tile_h - map_display_h * tile_h - 1
  end
end

--call all the keyboard check function
  function keyp_keypress(dt)
    check_escape()
    check_debug()
    check_debug_skip()
    player_movement(dt)
end

return keyp