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


