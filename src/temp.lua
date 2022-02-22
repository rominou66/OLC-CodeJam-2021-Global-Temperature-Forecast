local temp = {}

local temp_index = 0

--temperature data array
local current_global_temp   = {-0.16,-0.08,-0.1,-0.17,-0.28,-0.33,-0.31,-0.36,-0.17,-0.1,-0.35,-0.22,-0.27,-0.31,-0.3,-0.23,-0.11,-0.11,-0.27,-0.18,-0.08,-0.15,-0.28,-0.37,-0.47,-0.26,-0.22,-0.39,-0.43,-0.48,-0.44,-0.44,-0.36,-0.34,-0.15,-0.14,-0.36,-0.46,-0.3,-0.28,-0.28,-0.19,-0.29,-0.27,-0.27,-0.22,-0.11,-0.22,-0.2,-0.36,-0.16,-0.09,-0.16,-0.29,-0.13,-0.2,-0.15,-0.03,0,-0.02,0.13,0.19,0.07,0.09,0.2,0.09,-0.07,-0.03,-0.11,-0.11,-0.17,-0.07,0.01,0.08,-0.13,-0.14,-0.19,0.05,0.06,0.03,-0.03,0.06,0.03,0.05,-0.2,-0.11,-0.06,-0.02,-0.08,0.05,0.03,-0.08,0.01,0.16,-0.07,-0.01,-0.1,0.18,0.07,0.16,0.26,0.32,0.14,0.31,0.16,0.12,0.18,0.32,0.39,0.27,0.45,0.41,0.22,0.23,0.32,0.45,0.33,0.46,0.61,0.38,0.4,0.54,0.63,0.62,0.54,0.68,0.64,0.67,0.54,0.66,0.72,0.61,0.65,0.68,0.75,0.9,1.02,0.92,0.85,0.98,1.02,1.054,1.088,1.122,1.156,1.19,1.224,1.258,1.292,1.326,1.36,1.394,1.428,1.462,1.496,1.53,1.564,1.598,1.632,1.666,1.7,1.734,1.768,1.802,1.836,1.87,1.904,1.938,1.972,2.006,2.04,2.074,2.108,2.142,2.176,2.21,2.244,2.278,2.312,2.346,2.38,2.414,2.448,2.482,2.516,2.55,2.584,2.618,2.652,2.686,2.72,2.754,2.788,2.822,2.856,2.89,2.924,2.958}
local pledge_global_temp    = {-0.16,-0.08,-0.1,-0.17,-0.28,-0.33,-0.31,-0.36,-0.17,-0.1,-0.35,-0.22,-0.27,-0.31,-0.3,-0.23,-0.11,-0.11,-0.27,-0.18,-0.08,-0.15,-0.28,-0.37,-0.47,-0.26,-0.22,-0.39,-0.43,-0.48,-0.44,-0.44,-0.36,-0.34,-0.15,-0.14,-0.36,-0.46,-0.3,-0.28,-0.28,-0.19,-0.29,-0.27,-0.27,-0.22,-0.11,-0.22,-0.2,-0.36,-0.16,-0.09,-0.16,-0.29,-0.13,-0.2,-0.15,-0.03,0,-0.02,0.13,0.19,0.07,0.09,0.2,0.09,-0.07,-0.03,-0.11,-0.11,-0.17,-0.07,0.01,0.08,-0.13,-0.14,-0.19,0.05,0.06,0.03,-0.03,0.06,0.03,0.05,-0.2,-0.11,-0.06,-0.02,-0.08,0.05,0.03,-0.08,0.01,0.16,-0.07,-0.01,-0.1,0.18,0.07,0.16,0.26,0.32,0.14,0.31,0.16,0.12,0.18,0.32,0.39,0.27,0.45,0.41,0.22,0.23,0.32,0.45,0.33,0.46,0.61,0.38,0.4,0.54,0.63,0.62,0.54,0.68,0.64,0.67,0.54,0.66,0.72,0.61,0.65,0.68,0.75,0.9,1.02,0.92,0.85,0.98,1.02,1.045,1.07,1.095,1.12,1.145,1.17,1.195,1.22,1.245,1.27,1.295,1.32,1.345,1.37,1.395,1.42,1.445,1.47,1.495,1.52,1.545,1.57,1.595,1.62,1.645,1.67,1.695,1.72,1.745,1.77,1.795,1.82,1.845,1.87,1.895,1.92,1.945,1.97,1.995,2.02,2.045,2.07,2.095,2.12,2.145,2.17,2.195,2.22,2.245,2.27,2.295,2.32,2.345,2.37,2.395,2.42,2.445}
local opti_global_temp      = {-0.16,-0.08,-0.1,-0.17,-0.28,-0.33,-0.31,-0.36,-0.17,-0.1,-0.35,-0.22,-0.27,-0.31,-0.3,-0.23,-0.11,-0.11,-0.27,-0.18,-0.08,-0.15,-0.28,-0.37,-0.47,-0.26,-0.22,-0.39,-0.43,-0.48,-0.44,-0.44,-0.36,-0.34,-0.15,-0.14,-0.36,-0.46,-0.3,-0.28,-0.28,-0.19,-0.29,-0.27,-0.27,-0.22,-0.11,-0.22,-0.2,-0.36,-0.16,-0.09,-0.16,-0.29,-0.13,-0.2,-0.15,-0.03,0,-0.02,0.13,0.19,0.07,0.09,0.2,0.09,-0.07,-0.03,-0.11,-0.11,-0.17,-0.07,0.01,0.08,-0.13,-0.14,-0.19,0.05,0.06,0.03,-0.03,0.06,0.03,0.05,-0.2,-0.11,-0.06,-0.02,-0.08,0.05,0.03,-0.08,0.01,0.16,-0.07,-0.01,-0.1,0.18,0.07,0.16,0.26,0.32,0.14,0.31,0.16,0.12,0.18,0.32,0.39,0.27,0.45,0.41,0.22,0.23,0.32,0.45,0.33,0.46,0.61,0.38,0.4,0.54,0.63,0.62,0.54,0.68,0.64,0.67,0.54,0.66,0.72,0.61,0.65,0.68,0.75,0.9,1.02,0.92,0.85,0.98,1.02,1.0375,1.055,1.0725,1.09,1.1075,1.125,1.1425,1.16,1.1775,1.195,1.2125,1.23,1.2475,1.265,1.2825,1.3,1.3175,1.335,1.3525,1.37,1.3875,1.405,1.4225,1.44,1.4575,1.475,1.4925,1.51,1.5275,1.545,1.5625,1.58,1.5975,1.615,1.6325,1.65,1.6675,1.685,1.7025,1.72,1.7375,1.755,1.7725,1.79,1.8075,1.825,1.8425,1.86,1.8775,1.895,1.9125,1.93,1.9475,1.965,1.9825,2,2.0175}

--x values for displaying the data
local x_values              = {8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,128,136,144,152,160,168,176,184,192,200,208,216,224,232,240,248,256,264,272,280,288,296,304,312,320,328,336,344,352,360,368,376,384,392,400,408,416,424,432,440,448,456,464,472,480,488,496,504,512,520,528,536,544,552,560,568,576,584,592,600,608,616,624,632,640,648,656,664,672,680,688,696,704,712,720,728,736,744,752,760,768,776,784,792,800,808,816,824,832,840,848,856,864,872,880,888,896,904,912,920,928,936,944,952,960,968,976,984,992,1000,1008,1016,1024,1032,1040,1048,1056,1064,1072,1080,1088,1096,1104,1112,1120,1128,1136,1144,1152,1160,1168,1176,1184,1192,1200,1208,1216,1224,1232,1240,1248,1256,1264,1272,1280,1288,1296,1304,1312,1320,1328,1336,1344,1352,1360,1368,1376,1384,1392,1400,1408,1416,1424,1432,1440,1448,1456,1464,1472,1480,1488,1496,1504,1512,1520,1528,1536,1544,1552,1560,1568,1576,1584}

function draw_graph()
    --set the index to 1 at year 1880
    temp_index  = curr_year - 1880 + 1
    --reverse the values and scale by 100
    current_y   = (current_global_temp[temp_index] * -1) * 100
    pledge_y    = (pledge_global_temp[temp_index] * -1) * 100
    opti_y      = (opti_global_temp[temp_index] * -1) * 100

    --graph lines
    love.graphics.setLineWidth(1)
    love.graphics.setFont(font8)
    love.graphics.line(0, 300, 1600, 300)
    love.graphics.print("+ 2 Degrees Celsius", 10, 290)
    love.graphics.line(0, 400, 1600, 400)
    love.graphics.print("0 Degrees Celsius", 10, 390)
    love.graphics.line(0, 500, 1600, 500)
    love.graphics.print("- 2 Degrees Celsius", 10, 490)


    for i = 1, temp_index -1  do
        if curr_year >= 2021 then
        love.graphics.setFont(font16)
        -- draw the optimistic values in blue
        love.graphics.setColor(0.39,0.60,1)--blue
        love.graphics.draw(opti_point, x_values[temp_index], opti_y + 400, 0, 1, 1, opti_point:getWidth()/2, opti_point:getHeight()/2)
        love.graphics.print(""..tostring(opti_global_temp[temp_index]),x_values[temp_index] -105, opti_y + 500)
        love.graphics.line(x_values[temp_index]-70, opti_y + 500, x_values[temp_index], opti_y + 400)
        love.graphics.draw(point_blue,x_values[i], (opti_global_temp[i] * -1) * 100 + 400, 0, 1, 1, point_blue:getWidth()/2, point_blue:getHeight()/2)

        -- draw the pledge values in green
        love.graphics.setColor(0.6,0.89,0.31)--green
        love.graphics.draw(pledge_point, x_values[temp_index], pledge_y + 400, 0, 1, 1, pledge_point:getWidth()/2, pledge_point:getHeight()/2)
        love.graphics.print(""..tostring(pledge_global_temp[temp_index]),x_values[temp_index] - 85, pledge_y + 450)
        love.graphics.line(x_values[temp_index]-50, pledge_y + 450, x_values[temp_index], pledge_y + 400)
        love.graphics.draw(point_green,x_values[i], (pledge_global_temp[i] * -1) * 100 + 400, 0, 1, 1, point_green:getWidth()/2, point_green:getHeight()/2)

        -- draw the current values in red
        love.graphics.setColor(0.85,0.34,0.39)--red
        love.graphics.draw(current_point, x_values[temp_index], current_y + 400, 0, 1, 1, current_point:getWidth()/2, current_point:getHeight()/2)
        love.graphics.print(""..tostring(current_global_temp[temp_index]),x_values[temp_index]-85,current_y + 350)
        love.graphics.line(x_values[temp_index]-50, current_y + 365, x_values[temp_index], current_y + 400)
        love.graphics.draw(point_red,x_values[i], (current_global_temp[i] * -1) * 100 + 400, 0, 1, 1, point_red:getWidth()/2, point_red:getHeight()/2)
        
        -- show the graph legend
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", 5, 640, 470, 140, 20)

        love.graphics.setColor(0.85,0.34,0.39)--red
        love.graphics.draw(current_point, 10, 650, 0, 2, 2)
        love.graphics.print("= current policies forecast", 40, 652)

        love.graphics.setColor(0.6,0.89,0.31)--green
        love.graphics.draw(pledge_point, 10, 700, 0, 2, 2)
        love.graphics.print("= pledge policies forecast", 40, 702)

        love.graphics.setColor(0.39,0.60,1)--blue
        love.graphics.draw(opti_point, 10, 750, 0, 2, 2)
        love.graphics.print("= optimistic forecast", 40, 752)
        love.graphics.setColor(1, 1, 1)
    end

        --temperature before 2021 are draw in black
        if curr_year < 2021 then
            love.graphics.setColor(0.14,0.12,0.20)--black
            love.graphics.draw(pledge_point, x_values[temp_index], current_y + 400, 0, 1, 1, current_point:getWidth()/2, current_point:getHeight()/2)
            love.graphics.setFont(font16) 
            love.graphics.print(""..tostring(pledge_global_temp[temp_index]),x_values[temp_index], 510)
            love.graphics.line(x_values[temp_index], 510, x_values[temp_index], current_y + 400)
            love.graphics.setColor(1,1,1)
            love.graphics.draw(point_black,x_values[i], (current_global_temp[i] * -1) * 100 + 400, 0, 1, 1, point_black:getWidth()/2, point_black:getHeight()/2)
        end
    end
    love.graphics.setFont(font8)
end

return temp