local cheat_set_event_callback, surface_set_color, surface_draw_filled_rect, surface_draw_filled_rect_fade, surface_set_text_color, surface_set_text_pos, surface_set_text_font, surface_draw_text, surface_get_text_size, globals_tickcount, globals_tickinterval, globals_frametime, globals_realtime, globals_absoluteframetime, cheat_get_user_name, math_floor, config_get, engine_get_screen_size, surface_create_font = cheat.set_event_callback, surface.set_color, surface.draw_filled_rect, surface.draw_filled_rect_fade, surface.set_text_color, surface.set_text_pos, surface.set_text_font, surface.draw_text, surface.get_text_size, globals.tickcount, globals.tickinterval,  globals.frametime, globals.realtime, globals.absoluteframetime, cheat.get_user_name, math.floor, config.get, engine.get_screen_size, surface.create_font

local font = surface_create_font("Verdana", 12, 400, 0, 144)
local name = cheat_get_user_name()
local w, h = engine_get_screen_size()
local name_width = surface_get_text_size(font,name)
local text = "VLXTodo |"..name.."| 64 Tick |120 Fps"
local text_width = surface_get_text_size(font,text)
local menu_width = 10+text_width+10 

local x1,y1= w-5-text_width-20,5
local x2,y2 = w-5,y1+28

local function paint()
    local fps1 = 1 / globals_frametime()
    local fps = math_floor(fps1)
    local tick = 1/globals_tickinterval()
    local tickrate = math_floor(tick)
    --box
    surface_set_color(10, 10, 10, 255)
    surface_draw_filled_rect(x1,y1,x2,y2) 
    surface_set_color(60, 60, 60, 255)
    surface_draw_filled_rect(x1+1, y1+1, x2-1, y2-1)
    surface_set_color(40, 40, 40, 255)
    surface_draw_filled_rect(x1+2, y1+2, x2-2, y2-2)
    surface_set_color(60, 60, 60, 255)
    surface_draw_filled_rect(x1+5, y1+5, x2-5, y2-5) 
    surface_set_color(19, 19, 19, 255)
    surface_draw_filled_rect(x1+6, y1+6, x2-6, y2-6) 
    --gradient
    surface_set_color(55, 177, 218, 255)
    surface_draw_filled_rect_fade(x1+7, y1+7, x2-7, y1+9, 255, 0, true)
    surface_set_color(201, 72, 205, 255)
    surface_draw_filled_rect_fade(x1+(menu_width/15), y1+7, x1+(menu_width/2), y1+9, 0, 255, true)
    surface_draw_filled_rect_fade(x1+(menu_width/2), y1+7, x2-7, y1+9, 255, 0, true)
    surface_set_color(204 ,228, 50, 255)
    surface_draw_filled_rect_fade(x1+(menu_width/2)+(menu_width/8), y1+7, x2-7, y1+9, 0, 255, true)
    surface_set_color(0,0,0, 212)
    surface_draw_filled_rect(x1+7, y1+8, x2-7, y1+9)
    --text
    surface_set_text_color(220, 220, 220, 255)
    surface_set_text_pos(x1+10, y1+8) 
    surface_set_text_font(font)
    surface_draw_text("game")
    r, g, b, a = config_get("menu_color")
    surface_set_text_color(r, g, b,a)
    local game_width= surface_get_text_size(font,"game")
    surface_set_text_pos(x1+10+game_width, y1+8) 
    surface_draw_text("sense")
    surface_set_text_color(220, 220, 220, 255)
    local sense_width = surface_get_text_size(font,"sense")
    surface_set_text_pos(x1+10+game_width+sense_width, y1+8) 
    surface_draw_text("|")
    local line_width,line_height = surface_get_text_size(font,"|")
    local name_start = x1+10+game_width+sense_width+line_width
    surface_set_text_pos(name_start, y1+8) 
    surface_draw_text(name)
    surface_set_text_pos(name_start+name_width ,y1+8)
    surface_draw_text("|")
    local vars_start = name_start+name_width+line_width
    surface_set_text_color(r, g, b, a)
    surface_set_text_pos(vars_start, y1+8) 
    surface_draw_text(tickrate.." Tick")
    surface_set_text_color(220, 220, 220, 255)
    local tick_width = surface_get_text_size(font,tickrate.." Tick")
    surface_set_text_pos(vars_start+tick_width, y1+8)
    surface_draw_text("|")
    local fps_width= surface_get_text_size(font,"120 Fps")
    surface_set_text_pos(vars_start+tick_width+line_width, y1+8) 
    surface_draw_text(fps.." Fps")
end
cheat_set_event_callback("on_paint", paint)