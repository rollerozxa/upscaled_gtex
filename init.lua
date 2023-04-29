
local scale = minetest.settings:get("upscaled_gtex_scale") or 4

minetest.register_on_mods_loaded(function()
	for id,def in pairs(minetest.registered_nodes) do
		local tiles = def.tiles
		local target_tiles = {}

		if tiles then
			for index,_ in pairs(tiles) do
				if type(tiles[index]) == 'table' then
					tiles[index].align_style = 'world'
					tiles[index].scale = scale
					target_tiles[index] = tiles[index]
				else
					target_tiles[index] = {
						name = tiles[index],
						align_style = 'world',
						scale = scale
					}
				end
			end

			minetest.override_item(id, {
				tiles = target_tiles
			})
		end
	end
end)
