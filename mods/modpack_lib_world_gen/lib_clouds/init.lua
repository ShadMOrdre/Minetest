
lib_clouds = {}

local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

local water_level = tonumber(minetest.get_mapgen_setting("water_level"))



minetest.register_node('lib_clouds:cloud_cirrus', {
	description = S("Cirrus Cloud"),
	_doc_items_longdesc = S("3D Clouds"),
	_doc_items_usagehelp = S("Generates 3D Clouds in air between 120m and 200m."),
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	sunlight_propagates = false,
	walkable = false,
	pointable = false,
	diggable = false,
	climbable = false,
	buildable_to = false,
	sounds = default.node_sound_defaults(),
	groups = {lib_clouds = 1},

	--node lifespan
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(300)
	end,
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name = "air"})
	end,
})

minetest.register_node('lib_clouds:cloud_cumulus', {
	description = S("Cumulus Cloud"),
	_doc_items_longdesc = S("3D Clouds"),
	_doc_items_usagehelp = S("Generates 3D Clouds in air between 100 and 160m."),
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	sunlight_propagates = false,
	walkable = false,
	pointable = false,
	diggable = false,
	climbable = false,
	buildable_to = false,
	sounds = default.node_sound_defaults(),
	groups = {lib_clouds = 1},

	--node lifespan
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(300)
	end,
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name = "air"})
	end,
})

minetest.register_node('lib_clouds:cloud_fog', {
	description = S("Cirrus Cloud"),
	_doc_items_longdesc = S("3D Clouds"),
	_doc_items_usagehelp = S("Generates 3D Clouds in air between 1 and 60m."),
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	sunlight_propagates = false,
	walkable = false,
	pointable = false,
	diggable = false,
	climbable = false,
	buildable_to = false,
	sounds = default.node_sound_defaults(),
	groups = {lib_clouds = 1},

	--node lifespan
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(300)
	end,
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name = "air"})
	end,
})



minetest.register_ore({
	ore_type = "scatter", -- See "Ore types"
	ore = "lib_clouds:cloud_cirrus",
	wherein = "air",
	clust_scarcity = 8*8*8,
	clust_num_ores = 64,
	clust_size = 3,
	y_min = 120,
	y_max = 200,
	flags = "",
	noise_threshold = 0.5,
	noise_params = {offset=0, scale=1, spread={x=100, y=100, z=100}, seed=23, octaves=3, persist=0.70},
			--  ^ NoiseParams structure describing the perlin noise used for ore distribution.
			--  ^ Needed for sheet ore_type.  Omit from scatter ore_type for a uniform ore distribution
	random_factor = 1.0,
			--  ^ Multiplier of the randomness contribution to the noise value at any
			--   given point to decide if ore should be placed.  Set to 0 for solid veins.
			--  ^ This parameter is only valid for ore_type == "vein".
	--biomes = {"tundra", "desert"}
			--  ^ List of biomes in which this decoration occurs.  Occurs in all biomes if this is omitted,
			--  ^ and ignored if the Mapgen being used does not support biomes.
			--  ^ Can be a list of (or a single) biome names, IDs, or definitions.
})

minetest.register_ore({
	ore_type = "puff", -- See "Ore types"
	ore = "lib_clouds:cloud_cumulus",
	wherein = "air",
	clust_scarcity = 8*8*8,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = 100,
	y_max = 160,
	flags = "",
	noise_threshold = 0.5,
	noise_params = {offset=0, scale=1, spread={x=100, y=100, z=100}, seed=23, octaves=3, persist=0.70},
			--  ^ NoiseParams structure describing the perlin noise used for ore distribution.
			--  ^ Needed for sheet ore_type.  Omit from scatter ore_type for a uniform ore distribution
	random_factor = 1.0,
			--  ^ Multiplier of the randomness contribution to the noise value at any
			--   given point to decide if ore should be placed.  Set to 0 for solid veins.
			--  ^ This parameter is only valid for ore_type == "vein".
	biomes = {"rainforest", "deciduous_forest_swamp", "rainforest_swamp", "deciduous_forest", "coniferous_forest", "stone_grassland"}
			--  ^ List of biomes in which this decoration occurs.  Occurs in all biomes if this is omitted,
			--  ^ and ignored if the Mapgen being used does not support biomes.
			--  ^ Can be a list of (or a single) biome names, IDs, or definitions.
})

minetest.register_ore({
	ore_type = "puff", -- See "Ore types"
	ore = "lib_clouds:cloud_fog",
	wherein = {"air", "default:water_source",},
	clust_scarcity = 8*8*8,
	clust_num_ores = 8,
	clust_size = 3,
	y_min = 1,
	y_max = 60,
	flags = "",
	noise_threshold = 0.5,
	noise_params = {offset=0, scale=1, spread={x=100, y=100, z=100}, seed=23, octaves=3, persist=0.70},
			--  ^ NoiseParams structure describing the perlin noise used for ore distribution.
			--  ^ Needed for sheet ore_type.  Omit from scatter ore_type for a uniform ore distribution
	random_factor = 0.4,
			--  ^ Multiplier of the randomness contribution to the noise value at any
			--   given point to decide if ore should be placed.  Set to 0 for solid veins.
			--  ^ This parameter is only valid for ore_type == "vein".
	biomes = {"rainforest", "deciduous_forest_swamp", "rainforest_swamp" }
			--  ^ List of biomes in which this decoration occurs.  Occurs in all biomes if this is omitted,
			--  ^ and ignored if the Mapgen being used does not support biomes.
			--  ^ Can be a list of (or a single) biome names, IDs, or definitions.
})




minetest.register_abm{
     nodenames = {"lib_clouds:cloud_cirrus"},
	interval = 7.5,
	chance = 5,
	catch_up = false,
	action = function(pos)

		local radius = 4
		local growthlimitgoo = 3
		local airlimit = 15

	--count goolim
		local num_goolim = {}
		
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"lib_clouds:cloud_cirrus"})
		num_goolim = (cn["lib_clouds:cloud_cirrus"] or 0)

	--count air
		local num_gooair = {}
		local radius = 1
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"air"})
		num_gooair = (cn["air"] or 0)

	--Replicate
		
		randpos = {x = pos.x + math.random(-1,1), y = pos.y + math.random(-1,1), z = pos.z + math.random(-1,1)}
		
		if num_goolim < growthlimitgoo then

			--spread to air
			if (num_gooair) > airlimit and minetest.get_node(randpos).name == "air" then
					
				minetest.set_node(randpos, {name = "lib_clouds:cloud_cirrus"})
						
				minetest.sound_play("selfrep_roadbuild", {pos = pos, gain = 0.2, max_hear_distance = 10,})
			end	
				
		end
	
	end,
}

minetest.register_abm{
     nodenames = {"lib_clouds:cloud_cirrus"},
	interval = 6,
	chance = 12,
	catch_up = true,
	action = function(pos)


		local radius = 2
		local growthlimitgoo = 8
		local airlimit = 10

	--count goolim
		local num_goolim = {}
		
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"lib_clouds:cloud_cirrus"})
		num_goolim = (cn["lib_clouds:cloud_cirrus"] or 0)

	--count air
		local num_gooair = {}
		local radius = 1
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"air"})
		num_gooair = (cn["air"] or 0)



	-- for Replicate sideways
		
		randpos = {x = pos.x + math.random(-1,1), y = pos.y, z = pos.z + math.random(-1,1)}


	-- for check light level at destination
	 
		local light_level_ranpos = {}
		local light_level_ranpos  = ((minetest.get_node_light(randpos)) or 0)


		
-- do if well lit

	if  light_level_ranpos >=14 then

		

	if num_goolim < growthlimitgoo then

		--spread to air
		if (num_gooair) > airlimit and minetest.get_node(randpos).name == "air" then
			 	
			minetest.set_node(randpos, {name = "lib_clouds:cloud_cirrus"})
					
			minetest.sound_play("selfrep_roadbuild", {pos = pos, gain = 0.2, max_hear_distance = 10,})
		end	
			
	end
	end
end,
}



minetest.register_abm({
    nodenames = {"lib_clouds:cloud_cumulus"},
	neighbors = {"air"},
	interval = 15,
	chance = 10,
	catch_up = true,
	action = function(pos)

		local radius = 1
		local growthlimitgoo = 3
		local airlimit = 15

	--count goolim
		local num_goolim = {}
		
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"lib_clouds:cloud_cumulus"})
		num_goolim = (cn["lib_clouds:cloud_cumulus"] or 0)

	--count air
		local num_gooair = {}
		local radius = 1
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"air"})
		num_gooair = (cn["air"] or 0)

	--Replicate
		
		randpos = {x = pos.x + math.random(-1,1), y = pos.y + math.random(-1,1), z = pos.z + math.random(-1,1)}
		
		if num_goolim < growthlimitgoo then

			--spread to air
			if (num_gooair) > airlimit and minetest.get_node(randpos).name == "air" then
					
				minetest.set_node(randpos, {name = "lib_clouds:cloud_cumulus"})
						
				minetest.sound_play("selfrep_roadbuild", {pos = pos, gain = 0.2, max_hear_distance = 10,})
			end	
				
		end

	end,
})

minetest.register_abm({
    nodenames = {"lib_clouds:cloud_cumulus"},
	neighbors = {"air"},
	interval = 10,
	chance = 30,
	catch_up = true,
	action = function(pos)

		local radius = 2
		local growthlimitgoo = 8
		local airlimit = 10

	--count goolim
		local num_goolim = {}
		
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"lib_clouds:cloud_cumulus"})
		num_goolim = (cn["lib_clouds:cloud_cumulus"] or 0)

	--count air
		local num_gooair = {}
		local radius = 1
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"air"})
		num_gooair = (cn["air"] or 0)

	-- for Replicate sideways
		
		randpos = {x = pos.x + math.random(-1,1), y = pos.y, z = pos.z + math.random(-1,1)}

	-- for check light level at destination
	 
		local light_level_ranpos = {}
		local light_level_ranpos  = ((minetest.get_node_light(randpos)) or 0)

-- do if well lit

		if  light_level_ranpos >=14 then

			if num_goolim < growthlimitgoo then

				--spread to air
				if (num_gooair) > airlimit and minetest.get_node(randpos).name == "air" then
						
					minetest.set_node(randpos, {name = "lib_clouds:cloud_cumulus"})
							
					minetest.sound_play("selfrep_roadbuild", {pos = pos, gain = 0.2, max_hear_distance = 10,})
				end	
			end
		end
	end,
})




minetest.register_abm({
    nodenames = {"lib_clouds:cloud_fog"},
	neighbors = {"air"},
	interval = 5,
	chance = 5,
	catch_up = true,
	action = function(pos)

		local radius = 1
		local growthlimitgoo = 3
		local airlimit = 15

	--count goolim
		local num_goolim = {}
		
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"lib_clouds:cloud_fog"})
		num_goolim = (cn["lib_clouds:cloud_fog"] or 0)

	--count air
		local num_gooair = {}
		local radius = 1
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"air"})
		num_gooair = (cn["air"] or 0)

	--Replicate
		
		randpos = {x = pos.x + math.random(-1,1), y = pos.y + math.random(-1,1), z = pos.z + math.random(-1,1)}
		
		if num_goolim < growthlimitgoo then

			--spread to air
			if (num_gooair) > airlimit and minetest.get_node(randpos).name == "air" then
					
				minetest.set_node(randpos, {name = "lib_clouds:cloud_fog"})
						
				minetest.sound_play("selfrep_roadbuild", {pos = pos, gain = 0.2, max_hear_distance = 10,})
			end	
				
		end

	end,
})

minetest.register_abm({
    nodenames = {"lib_clouds:cloud_fog"},
	neighbors = {"air"},
	interval = 5,
	chance = 15,
	catch_up = true,
	action = function(pos)

		local radius = 2
		local growthlimitgoo = 8
		local airlimit = 10

	--count goolim
		local num_goolim = {}
		
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"lib_clouds:cloud_fog"})
		num_goolim = (cn["lib_clouds:cloud_fog"] or 0)

	--count air
		local num_gooair = {}
		local radius = 1
		local ps, cn = minetest.find_nodes_in_area(
			{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
			{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius}, {"air"})
		num_gooair = (cn["air"] or 0)

	-- for Replicate sideways
		
		randpos = {x = pos.x + math.random(-1,1), y = pos.y, z = pos.z + math.random(-1,1)}

	-- for check light level at destination
	 
		local light_level_ranpos = {}
		local light_level_ranpos  = ((minetest.get_node_light(randpos)) or 0)

-- do if well lit

		if  light_level_ranpos >=14 then

			if num_goolim < growthlimitgoo then

				--spread to air
				if (num_gooair) > airlimit and minetest.get_node(randpos).name == "air" then
						
					minetest.set_node(randpos, {name = "lib_clouds:cloud_fog"})
							
					minetest.sound_play("selfrep_roadbuild", {pos = pos, gain = 0.2, max_hear_distance = 10,})
				end	
			end
		end
	end,
})



