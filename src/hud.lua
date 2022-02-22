local hud = {}

local blink = 0
local add = true

function hud_draw()
    love.graphics.draw(hud_arrow, 1400, 32, 0, 1, 1, 0, 0, 0, 0)

    --top and bottom guide line
    love.graphics.setLineWidth(5)
    love.graphics.setLineStyle("smooth")
    love.graphics.line(142, 48, 1435, 48)
    love.graphics.line(142, 80, 1435, 80)

    --moving marker
    love.graphics.setColor(0.67, 0.19, 0.19, blink)
    love.graphics.rectangle("fill", back_1_map_x / 14 + 158, 32, 5, 64)
    love.graphics.setColor(0.67, 0.19, 0.19)
    love.graphics.print("Present", back_1_map_x / 14 + 134, 20)

    --left end stop rectangle
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 140, 32, 20, 64)

    --text on screen
    love.graphics.print("Past", 134, 100)
    love.graphics.print("Future", 1400, 100)
    love.graphics.setFont(font16)
    love.graphics.print("Year: "..tostring(curr_year), 720, 100)

    if curr_year <= 1890 then
        love.graphics.print("Use 'A' and 'D' to scroll through time", 500, 200)
    end
    love.graphics.setFont(font16, 32)
    love.graphics.setColor(1,1,1,blink + 0.5)
    love.graphics.print("Made by:",1350,680,-0.4)
    love.graphics.print("rominou66",1400,700,-0.4)
    love.graphics.setColor(1,1,1)
end

function alpha_blink()
    --go from zero to one alpha and then reverse
    if blink < 1 and add == true then
    blink = blink + 0.025
    elseif blink > 1 then
    add = false
    end
    if blink > 0 and add == false then
        blink = blink - 0.025
    elseif blink < 0 then
        add = true
    end
end

function current_year()
    --calculate the year to fit the timeline onto the display
    curr_year = math.floor(back_1_map_x / 92.58 + 1880)
end

return hud