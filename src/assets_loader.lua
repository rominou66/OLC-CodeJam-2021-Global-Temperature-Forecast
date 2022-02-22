local assets_loader = {}

local swap = false
local timer = 1

function assets_load()
    --font
    font8  = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf", 8)
    font16 = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf", 16)

    --hud
    hud_arrow = love.graphics.newImage("assets/hud/arrow.png")
    old_point = love.graphics.newImage("assets/hud/old_point.png")
    current_point = love.graphics.newImage("assets/hud/current_point.png")
    pledge_point = love.graphics.newImage("assets/hud/pledge_point.png")
    opti_point = love.graphics.newImage("assets/hud/opti_point.png")
    point_red = love.graphics.newImage("assets/hud/point_red.png")
    point_black = love.graphics.newImage("assets/hud/point_black.png")
    point_green = love.graphics.newImage("assets/hud/point_green.png")
    point_blue= love.graphics.newImage("assets/hud/point_blue.png")

    --background_tileset
    back_tile = {}
	for i=0,27 do -- change 3 to the number of tile images minus 1.
		back_tile[i] = love.graphics.newImage("assets/tilemap/tile"..i..".png")
	end
    --save the tile for animation
    temp_tile = back_tile[23]
    temp_tile_2 = back_tile[25]
end

function anim(dt)
    --remove dt to the timer
    timer = timer - dt
    --when timer reach zero perform the swap of sprite
    if timer <= 0 then
        if swap == false then
            back_tile[23] = back_tile[24]
            back_tile[25] = back_tile[26]
            swap = true
 
        elseif swap == true then
            back_tile[23] = temp_tile
            back_tile[25] = temp_tile_2
            swap = false 
        end
        --reset timer
        timer = timer + 1
    end
end

return assets_loader