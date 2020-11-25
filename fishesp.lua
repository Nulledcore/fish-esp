local fish_esp = ui.new_multiselect("visuals", "other esp", "Fish ESP", {"Name", "Box"})
local fish_esp_clr = ui.new_color_picker("visuals", "other esp", "fishclr", 255, 255, 255, 255)
local surface = require 'gamesense/surface'

local function contains(item, val)
	table = ui.get(item)
	for i=1,#table do
		if table[i] == val then 
			return true
		end
	end
	return false
end

client.set_event_callback("paint", function()
    for _, v in pairs(entity.get_all("CFish")) do
        local x,y,z = entity.get_prop(v, "m_vecOrigin")
        local wx, wy = renderer.world_to_screen(x, y, z)
        local clr = {ui.get(fish_esp_clr)}
        if wx then
            if contains(fish_esp, "Name") then
                renderer.text(wx, wy-18, clr[1], clr[2], clr[3], clr[4], "c-", nil, "LE  FISHE")
            end
            if contains(fish_esp, "Box") then
                surface.draw_outlined_rect(wx-(45/2), wy-(45/2)+(25/2), 45, 45, clr[1], clr[2], clr[3], clr[4])
                surface.draw_outlined_rect(wx-(45/2)-1, wy-(45/2)+(25/2)-1, 47, 47, 0, 0, 0, clr[4])
                surface.draw_outlined_rect(wx-(45/2)+1, wy-(45/2)+(25/2)+1, 43, 43, 0, 0, 0, clr[4])
            end
        end
    end
end)
