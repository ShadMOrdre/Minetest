--
--lib_node_shapes
--copyright 2017 ShadMOrdre@gmail.com
--
--A mod for Minetest that provides various nodeboxes that can then be applied to any "materials" type
--node.  The "materials" are generally defined as stone, metal, tree, wood, and glass.  The shapes are
--nodeboxes, and a shape node is created and presented in a users inventory.  Shapes are created in separate
--mods, organized according to below.  The entire collection is included in the modpack.

--Among the shapes provided are:
--	Columns, Pillars, Beams
--	Doors  (Solid, Windowed, Sliding, and larger doors of sizes 3x1.5 and 4x2)
--	Fences	(Includes railing nodes as well as standard fencing)
--	Furniture	(Chairs, Tables, Sofa section pieces, a (currently) non working bed
--	Gates	(Solid and Railed type gates, with attached support post.  These are essentially half-height doors, thus, will be merged)
--	General	(Cylinders, Linkages, various other standard shapes)
--	Lights	(Dekstop, Hanging, Wall-Mounted, an Overhead strip light, and a "magic" bulb that can attach to most materials)
--	Religious	(Various religous themed shapes.  Currently, a cross, a tombstone, and a tomb.)
--	Slabs	(Slabs of thicknesses: 1/16, 1/8, 1/4, 1/2)
--	Stairs	(Includes standard 2 step stairs, and custom 4 step stairs, of various designs)
--	Tree	(These nodes connect only to tree, leaves and themselves.  Designed for creating more elaborate trees)
--	Wall	(Walls of thicknesses: 1/16, 1/8, 1/4, 1/2, 3/4

--**LICENSING**
--For the sections of code copied from minetest_game, the code is licensed LGPL2.1.
--For the sections of code copied from xdecor, the code is licensed ###############.
--For all other code, license is MIT.

--All graphics are original works by ShadMOrdre@gmail.com, and are licensed CC-BY-SA.


lib_node_shapes = {}

local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

lib_node_shapes.registered_shapes = {}

local modpath = minetest.get_modpath("lib_node_shapes")
local applicable_nodes = {}
lib_node_shapes.registered_doors = {}

lib_node_shapes.shapes_created = 0
lib_node_shapes.nodes_used = 0
lib_node_shapes.nodes_created = 0

local materials = {"stone", "metal", "tree", "wood", "glass" }

dofile(modpath.."/craftitems.lua")
dofile(modpath.."/utility.lua")

function lib_node_shapes.get_nodes()

	local node_counter = 0
	local add_node = false

	for node, def in pairs(minetest.registered_nodes) do

		local registered_node_name
		local node_full_name = {}
		local node_def = {}
		local node_mod
		local node_name
		
		if (node ~= "air") or (node ~= "") and node then
			registered_node_name = node
			node_full_name = string.split(node, ":")
			node_def = table.copy(def)
			node_mod = node_full_name[1]
			node_name = node_full_name[2]
			
			if node_mod then
				if string.find(node_mod, "default") or string.find(node_mod, "darkage") or string.find(node_mod, "ethereal") or string.find(node_mod, "moreblocks") or string.find(node_mod, "moreores") or string.find(node_mod, "columnia") or string.find(node_mod, "cottages") or string.find(node_mod, "xdecor") then
					if node_name then
						if node_def then
							if node_def.description then
								if node_def.groups then
									--if (not node_def.drawtype) or (node_def.drawtype == "glasslike_framed_optional") then

										local node_groups = table.copy(node_def.groups)

										if minetest.get_item_group(node_name, "stone") >= 1 or minetest.get_item_group(node_name, "tree") >= 1 or minetest.get_item_group(node_name, "wood") >= 1 or minetest.get_item_group(node_name, "glass") >= 1 or minetest.get_item_group(node_name, "cracky") >= 1 or minetest.get_item_group(node_name, "choppy") >= 1 or minetest.get_item_group(node_name, "level") then
											add_node = true
										end
											
										if string.find(node_name, "stone") or string.find(node_name, "glass") or string.find(node_name, "tree") or string.find(node_name, "wood") then
											add_node = true
										end

										if node_def.drawtype then
											add_node = false
										end
										
										
										--string.find(node, "default") and 
										if string.find(node_name, "glass") then
											add_node = true
										end
										
										
										if node_def.drawtype == "glasslike_framed_optional" then
												add_node = true
										end
										
										if string.find(node_name, "chest") or string.find(node_name, "furnace") or string.find(node_name, "shelv") or string.find(node_name, "mineral") or string.find(node_name, "_with_") or string.find(node_name, "ore") or string.find(node_name, "checkered") or string.find(node_name, "pane") or string.find(node_name, "micro") or string.find(node_name, "split") or string.find(node_name, "slope") or string.find(node_name, "npc") or string.find(node_name, "dirt") or string.find(node_name, "grass") or string.find(node_name, "leaves") or string.find(node_name, "cloud") or string.find(node_name, "dried") or string.find(node_name, "command") or string.find(node_name, "move") or string.find(node_name, "off") or string.find(node_name, "stair") or string.find(node_name, "slab") or string.find(node_name, "moss") or string.find(node_name, "sandy") or string.find(node_name, "glo") or string.find(node_name, "shelf") or string.find(node_name, "quick") or string.find(node_name, "bush") or string.find(node_name, "gravel") or string.find(node_name, "cactus") or string.find(node_name, "tar") then
											--minetest.log("LIST:     " .. node_name)
											add_node = false
										end
											
										--[[
										if string.find(node_mod, "mesecon") or string.find(node_mod, "moreblocks") or ### then
											add_node = false
										end
										--]]
										
										--minetest.get_item_group(node_name, "crumbly") or 
										if (minetest.get_item_group(node_name, "soil") >= 1 or minetest.get_item_group(node_name, "attached_node") >= 1) then
											add_node = false
										end

--[[
										if string.find(node_name, "tree") or string.find(node_name, "trunk") or string.find(node_name, "wood") or string.find(node_name, "brick") then
											--minetest.debug(node_mod .. ":" .. node_name)
											if string.find(node_mod, "ethereal") then
												--minetest.debug(node_mod)
												add_node = true
											end
										end
--]]

										
										if add_node == true then
											minetest.log("lib_node_shapes.get_nodes:USING MATERIAL...     " .. node)
											node_counter = node_counter + 1
											applicable_nodes[node] = def
										end
									--end
								end
							end
						end
					end
				end
			end
		end
	end
	
	lib_node_shapes.nodes_used = lib_node_shapes.nodes_used + node_counter
	minetest.log("TOTAL: --Nodes to be counted as materials-- :" .. lib_node_shapes.nodes_used)

end

function lib_node_shapes.get_shapes()

	--local shape_list = {}
	
	for shape, def in pairs(registered_shapes) do

		--local shape_name = shape
		--local shape_def = table.copy(def)

		lib_node_shapes.shapes_created = lib_node_shapes.shapes_created + 1

		--minetest.debug("get_shapes:ShapeName:    " .. shape_name)
		--minetest.debug("get_shapes:ShapeDesc:    " .. shape_def.description)
		minetest.debug(lib_node_shapes.shapes_created)
		
		--shape_list[shape_name] = shape_def
		
	end

	--minetest.debug(minetest.serialize(shape_list))


end

lib_node_shapes.get_nodes()

lib_node_shapes.register_shape = function(shape_name, shape_def)

	local new_shape_name = ""
	local new_shape_def = {}

	new_shape_name = "lib_node_shapes:shape_" .. shape_name
	new_shape_def = {
		description = shape_def.description .. " Shape",
		drawtype = "nodebox",
		tiles = {
			"grey_noise.png^align_grid_ypos.png",
			"grey_noise.png^align_grid_yneg.png",
			"grey_noise.png^align_grid_xpos.png",
			"grey_noise.png^align_grid_xneg.png",
			"grey_noise.png^align_grid_zpos.png",
			"grey_noise.png^align_grid_zneg.png",
		},
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:lib_node_shapes_library" },
		is_ground_content = false,
		walkable = true,
		groups = { oddly_breakable_by_hand = 3, lib_node_shapes_library = 3 },
		node_box = shape_def.node_box,
		selection_box = shape_def.selection_box,
		collision_box = shape_def.collision_box,

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	}

	if shape_def.shape_type == "door" then
		--new_shape_def.visual_size={x = 0.5, y = 0.5}
	end

	minetest.register_node(":" .. new_shape_name, new_shape_def)
	minetest.register_craft({
		output = new_shape_name .. " 1",
		recipe = {
			{ 'lib_node_shapes:blueprint', 'lib_node_shapes:blueprint', 'lib_node_shapes:blueprint' },
			{ '', 'lib_node_shapes:blueprint', ''},
			{ '', '', ''},
		}
	})
	
	lib_node_shapes.registered_shapes[new_shape_name] = shape_def

	lib_node_shapes.shapes_created = lib_node_shapes.shapes_created + 1

	minetest.log("NEW SHAPE:     = " .. new_shape_name)
	lib_node_shapes.register_shaped_nodes(shape_name, shape_def)

end





lib_node_shapes.register_shaped_nodes =  function(shape_name, shape_def)

	local node_counter = 0

	for node, def in pairs(applicable_nodes) do

		local node_name = {}
		local node_def = {}
		local new_node_name = ""
		local new_node_def = {}
		local new_node_groups = {}
		local new_node_tiles = {}

		node_name = string.split(node, ":")
		new_node_name = "lib_node_shapes:" .. node_name[2] .. "_" .. shape_name

		node_def = table.copy(def)

		new_node_groups = table.copy(node_def.groups)

		if node_def.tiles then
			if node_def.tiles[1] then
				new_node_tiles[1] = node_def.tiles[1]
			else
				new_node_tiles[1] = node_def.tiles
			end
			if node_def.tiles[2] then
				new_node_tiles[2] = node_def.tiles[2]
			else
				new_node_tiles[2] = new_node_tiles[1]
			end
			if node_def.tiles[3] then
				new_node_tiles[3] = node_def.tiles[3]
			else
				new_node_tiles[3] = new_node_tiles[2]
			end
			if node_def.tiles[4] then
				new_node_tiles[4] = node_def.tiles[4]
			else
				new_node_tiles[4] = new_node_tiles[3]
			end
			if node_def.tiles[5] then
				new_node_tiles[5] = node_def.tiles[5]
			else
				new_node_tiles[5] = new_node_tiles[3]
			end
			if node_def.tiles[6] then
				new_node_tiles[6] = node_def.tiles[6]
			else
				new_node_tiles[6] = new_node_tiles[3]
			end
			if shape_def.shape_type == "tree" then
				new_node_tiles[1] = node_def.tiles[1]
				new_node_tiles[2] = node_def.tiles[2]
				new_node_tiles[3] = node_def.tiles[3]
				new_node_tiles[4] = node_def.tiles[3]
				new_node_tiles[5] = node_def.tiles[3]
				new_node_tiles[6] = node_def.tiles[3]
			end
			if shape_def.shape_type == "light" then
				if string.find(shape_name, "lamp") then
					new_node_tiles = {
						"(overlay_alpha_light_lamp_frame.png^" .. node_def.tiles[1] .. "^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
						"(overlay_alpha_light_lamp_frame.png^" .. node_def.tiles[1] .. "^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
						"(overlay_alpha_light_lamp_frame.png^" .. node_def.tiles[1] .. "^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
						"(overlay_alpha_light_lamp_frame.png^" .. node_def.tiles[1] .. "^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
						"(overlay_alpha_light_lamp_frame.png^" .. node_def.tiles[1] .. "^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
						"(overlay_alpha_light_lamp_frame.png^" .. node_def.tiles[1] .. "^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
					}
				else
					new_node_tiles = {
						node_def.tiles[1],
						"default_cloud.png",
						node_def.tiles[1],
						node_def.tiles[1],
						node_def.tiles[1],
						node_def.tiles[1],
					}
				end
			end
		end

		new_node_groups.not_in_creative_inventory = 1
		new_node_groups.lib_shaped_node = 3

		new_node_def = {
			description = node_def.description .. " " .. shape_def.description,
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			tiles = new_node_tiles,
			is_ground_content = false,
			walkable = true,
			groups = new_node_groups,
			sounds = node_def.sounds,
			base_material = def.name,
			shape_type = shape_def.shape_type or shape_name,


			on_place = function(itemstack, placer, pointed_thing)
				if pointed_thing.type ~= "node" then
					return itemstack
				end

				local p0 = pointed_thing.under
				local p1 = pointed_thing.above
				local param2 = 0

				local placer_pos = placer:getpos()
				if placer_pos then
					local dir = {
						x = p1.x - placer_pos.x,
						y = p1.y - placer_pos.y,
						z = p1.z - placer_pos.z
					}
					param2 = minetest.dir_to_facedir(dir)
				end

				if p0.y-1 == p1.y then
					param2 = param2 + 20
					if param2 == 21 then
						param2 = 23
					elseif param2 == 23 then
						param2 = 21
					end
				end

				return minetest.item_place(itemstack, placer, pointed_thing, param2)
			end,

		}


		if shape_def.shape_type == "door" then

			local name_closed = ":" .. new_node_name
			local name_opened = ":" .. new_node_name .."_open"
			local skel_key = false

			new_node_def.sound_open = "doors_door_open"
			new_node_def.sound_close = "doors_door_close"

			new_node_def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
				lib_node_shapes.door_toggle(pos, node, clicker)
				return itemstack
			end

			if skel_key then
				new_node_def.can_dig = can_dig_door
				new_node_def.after_place_node = function(pos, placer, itemstack, pointed_thing)
					local pn = placer:get_player_name()
					local meta = minetest.get_meta(pos)
					meta:set_string("doors_owner", pn)
					meta:set_string("infotext", "Owned by "..pn)

					return minetest.setting_getbool("creative_mode")
				end

				new_node_def.on_blast = function() end
				new_node_def.on_key_use = function(pos, player)
					local door = lib_node_shapes.get(pos)
					lib_node_shapes:toggle(player)
				end
				new_node_def.on_skeleton_key_use = function(pos, player, newsecret)
					local meta = minetest.get_meta(pos)
					local owner = meta:get_string("doors_owner")
					local pname = player:get_player_name()

					-- verify placer is owner of lockable door
					if owner ~= pname then
						minetest.record_protection_violation(pos, pname)
						minetest.chat_send_player(pname, "You do not own this trapdoor.")
						return nil
					end

					local secret = meta:get_string("key_lock_secret")
					if secret == "" then
						secret = newsecret
						meta:set_string("key_lock_secret", secret)
					end

					return secret, "a locked trapdoor", owner
				end
			else
				new_node_def.on_blast = function(pos, intensity)
					minetest.remove_node(pos)
					return {name}
				end
			end

			local def_opened = table.copy(new_node_def)
			local def_closed = table.copy(new_node_def)

			def_closed.node_box = shape_def.node_box
			def_closed.selection_box = shape_def.selection_box

			def_opened.node_box = shape_def.open_node_box
			def_opened.selection_box = shape_def.open_selection_box

			def_opened.drop = name_closed
			def_opened.groups.not_in_creative_inventory = 1

			minetest.register_node(name_opened, def_opened)
			minetest.register_node(name_closed, def_closed)

			lib_node_shapes.registered_doors[name_opened] = true
			lib_node_shapes.registered_doors[name_closed] = true

		end

		if shape_def.shape_type == "basic" then

			new_node_def.node_box = shape_def.node_box
			new_node_def.selection_box = shape_def.selection_box
			new_node_def.collision_box = shape_def.collision_box

		end

		if shape_def.shape_type == "seat" then
			
			new_node_def.node_box = shape_def.node_box
			new_node_def.selection_box = shape_def.selection_box
			new_node_def.collision_box = shape_def.collision_box

			new_node_def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
				pos.y = pos.y + 0  -- Sitting position.
				lib_node_shapes.sit(pos, node, clicker, pointed_thing)
			end
		end

		if shape_def.shape_type == "light" then

			--node_def.tiles = shape_def.tiles
			new_node_def.node_box = shape_def.node_box
			--new_node_def.selection_box = shape_def.selection_box
			--new_node_def.collision_box = shape_def.collision_box

			new_node_def.light_source = 14
			new_node_def.connects_to = { "group:stone", "group:wood", "group:glass", "group:cracky", "group:lib_shaped_node" }
		--else
			--node_def.tiles = new_node_tiles
		end

		if shape_def.shape_type == "connected" then

			new_node_def.node_box = shape_def.node_box
			--new_node_def.selection_box = shape_def.selection_box
			--new_node_def.collision_box = shape_def.collision_box

			new_node_def.connects_to = { "group:stone", "group:wood", "group:glass", "group:cracky", "group:lib_shaped_node" }
		end

		if shape_def.shape_type == "tree" then

			new_node_def.node_box = shape_def.node_box
			--new_node_def.selection_box = shape_def.selection_box
			--new_node_def.collision_box = shape_def.collision_box

			new_node_def.connects_to = { "group:tree", "group:leaves" }
		end

		if shape_def.shape_type ~= "door" then
			minetest.register_node(":" .. new_node_name, new_node_def)
		end
		
		minetest.register_craft({
			output = new_node_name .. " 99",
			recipe = {
				{ '', '', '' },
				{ '', 'lib_node_shapes:shape_' .. shape_name, ''},
				{ '', node_name[1] .. ":" .. node_name[2], ''},
			}
		})

		node_counter = node_counter + 1
		--minetest.log("NEW SHAPED NODE:     = " .. new_node_name)

	end

	lib_node_shapes.nodes_created = lib_node_shapes.nodes_created + node_counter
	minetest.log("TOTAL NODES CREATED:  " .. lib_node_shapes.nodes_created)

end


--SUPPORTED NODES  (Not a comprehensive list, as all mods can be detected)
--[[Default stone materials
"default:cobble"
"default:mossycobble"
"default:desert_cobble"
"default:brick"
"default:stone"
"default:desert_stone"
"default:sandstone"
"default:stone_block"
"default:desert_stone_block"
"default:sandstone_block"
"default:stonebrick"
"default:desert_stonebrick"
"default:sandstonebrick"
"default:obsidian"
"default:obsidian_block"
"default:obsidianbrick"
]]
--[[Default glass materials
"default:glass"
"default:obsidian_glass"
]]
--[[Default wood materials
"default:wood"
"default:tree"
"default:jungletree"
"default:junglewood"
"default:pine_tree"
"default:pine_wood"
"default:acacia_tree"
"default:acacia_wood"
]]
--[[Dark Age materials
"darkage:adobe"
"darkage:basalt"
"darkage:basalt_cobble"
"darkage:cobble_with_plaster"
"darkage:desert_stone_cobble"
"darkage:gneiss"
"darkage:gneiss_cobble"
"darkage:marble"
"darkage:ors"
"darkage:ors_cobble"
"darkage:sandstone_cobble"
"darkage:serpentine"
"darkage:shale"
"darkage:schist"
"darkage:slate"
"darkage:slate_cobble"
"darkage:slate_tale"
"darkage:stone_brick"
"darkage:marble"
"darkage:marble_tile"
]]
--[[Ethereal materials
"ethereal:willow_trunk"
"ethereal:willow_wood"
"ethereal:redwood_trunk"
"ethereal:redwood_wood"
"ethereal:frost_tree"
"ethereal:frost_wood"
"ethereal:yellow_trunk"
"ethereal:yellow_wood"
"ethereal:palm_trunk"
"ethereal:palm_wood"
"ethereal:banana_trunk"
"ethereal:banana_wood"
"ethereal:scorched_tree"
"ethereal:mushroom_trunk"
"ethereal:birch_trunk"
"ethereal:birch_wood"
]]
--[[More Blocks materials
"moreblocks:stone_tile"
"moreblocks:circle_stone_bricks"
"moreblocks:split_stone_tile"
"moreblocks:split_stone_tile_alt"
]]
--[[XDecor materials
"xdecor:barrel"
"xdecor:cabinet"
"xdecor:cabinet_half"
"xdecor:desertstone_tile"
"xdecor:hard_clay"
"xdecor:stone_rune"
]]
--[[Template
]]










