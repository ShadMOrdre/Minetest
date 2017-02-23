minetest.register_craftitem("lib_node_shapes:blueprint", {
	description = "lib_node_shapes Blueprint",
	inventory_image = "lib_node_shapes_blueprint.png",
})
minetest.register_craft({
	output = 'lib_node_shapes:blueprint',
	recipe = {
		{'default:paper', 'default:paper', 'default:paper'},
		{'default:paper', 'lib_node_shapes:pencil', 'default:paper'},
		{'default:paper', 'default:paper', 'default:paper'},
	}
})

minetest.register_craftitem("lib_node_shapes:pencil", {
	description = "lib_node_shapes Pencil",
	inventory_image = "lib_node_shapes_pencil.png",
})
minetest.register_craft({
	output = 'lib_node_shapes:pencil',
	recipe = {
		{'', 'group:stick', ''},
		{'', 'default:coal_lump', ''},
		{'', '', ''},
	}
})

minetest.register_node("lib_node_shapes:light_overhead_flourescent",{
	drawtype="nodebox",
	description= "Strip Light",
	light_source = 14,
	tiles = { 'default_wood.png',
	          'default_cloud.png',
			  'default_wood.png',
			  'default_wood.png',
			  'default_wood.png',
			  'default_wood.png' },
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.250000,-0.250000,0.500000,0.407216,0.250000},
			{-0.500000,0.312500,-0.062500,0.500000,0.500000,0.062500}, 
		},
	},
	groups={oddly_breakable_by_hand=3},
})

