local assets_loader = require("src.assets_loader")
local debug         = require("src.debug")
local keyp          = require("src.keyboard")
local hud           = require("src.hud")  
local tilemap       = require("src.tilemap")
local temp          = require("src.temp")

function love.load(arg)
love.graphics.setDefaultFilter('nearest', 'nearest')
--load all the sprite and fonts
assets_load()
end


function love.update(dt)
  --set the alternating alpha blend for the time cursor
  alpha_blink()
  --calculate the year to display
  current_year()
  --check keyboard input
  keyp_keypress(dt)
  --update the animation
  anim(dt)
end
  
function love.draw(dt)
  --draw the background in order
  background_3_draw()
  background_2_draw()
  background_1_draw()
  --draw the hud
  hud_draw()
  --draw the temp graph
  draw_graph()
  --draw debug
  debug_draw(dt)
end