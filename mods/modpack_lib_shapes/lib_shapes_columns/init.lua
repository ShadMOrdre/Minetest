--[[ TEMPLATE
	lib_node_shapes.register_shape(name, description, node_box, selection_box, collision_box)
		Name			Name of the shape within the library
		Description		Full Text description of above name
		Node_Box		node_box = {
							type = "fixed",
							fixed = {
								{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
							},
						},


							(above example for a static node_box
											OR
							below example for a connected node_box)


						node_box = {
							type = "connected",
							fixed = {
								{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
							},
							connect_front = {
								{-0.125, -0.0625, -0.5, 0.125, 0.0625, -0.0625}, -- Front_h_zneg
							},
							connect_back = {
								{-0.125, -0.0625, 0.0625, 0.125, 0.0625, 0.5}, -- Back_h_zpos
							},
							connect_left = {
								{-0.5, -0.0625, -0.125, -0.0625, 0.0625, 0.125}, -- Left_h_xneg
							},
							connect_right = {
								{0.0625, -0.0625, -0.125, 0.5, 0.0625, 0.125}, -- Right_h_xpos
							},
							connect_bottom = {
								{-0.125, -0.5, -0.0625, 0.125, -0.0625, 0.0625}, -- Bottom_x_yneg
							},
							connect_top = {
								{-0.125, 0.0625, -0.0625, 0.125, 0.5, 0.0625}, -- Top_x_ypos
							},
						},

		Selection_Box	Follows the same as above for fixed node_box.  Standard definition.
		Collision_Box	Follows the same as above for fixed node_box.  Standard definition.

EXAMPLE:

lib_node_shapes.register_shape(
	"shape_somename",					--All shape names WILL BE prefixed with 'shape_'.  This allows shapes to be sorted together in inventory.
	"Unique text description of the shape",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
)

--]]

local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end



lib_node_shapes.register_shape("column_base_050_height_100_width", {
	description = "Column Base Half Height Full Width", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		   {-0.4375, 0.0625, -0.4375, 0.4375, 0.4375, 0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
lib_node_shapes.register_shape("column_base_100_height_100_width", {
	description = "Column Base Full Height Full Width", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		   {-0.5, -0.25, -0.25, 0.5, 0.5, 0.25},
		   {-0.25, -0.25, -0.5, 0.25, 0.5, 0.5},
		   {-0.4375, -0.25, -0.4375, 0.4375, 0.4375, 0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})

lib_node_shapes.register_shape("column_base_round_100_height_100_width", {
	description = "Column Base Round Full Height Full Width", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- Front_h_zneg
			{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5}, -- Back_h_zpos
			{-0.3125, -0.5, -0.4375, 0.3125, 0.5, 0.4375}, -- NodeBox16
			{-0.4375, -0.5, -0.3125, 0.4375, 0.5, 0.3125}, -- NodeBox17
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}, -- NodeBox20
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox21
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})

lib_node_shapes.register_shape("column_base_round_3x3_ext", {
	description = "Column Base Round 3x3 Extension", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0, 0.5},
			{-0.375, -0.5, 0.375, 0.375, 0, 0.4375},
			{-0.1875, -0.5, 0.3125, 0.1875, 0, 0.375},
			{-0.4375, 0, 0.4375, 0.4375, 0.1875, 0.5},
			{-0.3125, 0, 0.375, 0.3125, 0.1875, 0.4375},
			{-0.125, 0, 0.3125, 0.125, 0.1875, 0.375},
			{-0.375, 0.1875, 0.4375, 0.375, 0.3125, 0.5},
			{-0.25, 0.1875, 0.375, 0.25, 0.3125, 0.4375},
			{-0.0625, 0.1875, 0.3125, 0.0625, 0.3125, 0.375},
			{-0.3125, 0.3125, 0.4375, 0.3125, 0.4375, 0.5},
			{-0.1875, 0.3125, 0.375, 0.1875, 0.4375, 0.4375},
			{-0.125, 0.4375, 0.4375, 0.125, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0, 0.5},
			{-0.375, -0.5, 0.375, 0.375, 0, 0.4375},
			{-0.1875, -0.5, 0.3125, 0.1875, 0, 0.375},
			{-0.4375, 0, 0.4375, 0.4375, 0.1875, 0.5},
			{-0.3125, 0, 0.375, 0.3125, 0.1875, 0.4375},
			{-0.125, 0, 0.3125, 0.125, 0.1875, 0.375},
			{-0.375, 0.1875, 0.4375, 0.375, 0.3125, 0.5},
			{-0.25, 0.1875, 0.375, 0.25, 0.3125, 0.4375},
			{-0.0625, 0.1875, 0.3125, 0.0625, 0.3125, 0.375},
			{-0.3125, 0.3125, 0.4375, 0.3125, 0.4375, 0.5},
			{-0.1875, 0.3125, 0.375, 0.1875, 0.4375, 0.4375},
			{-0.125, 0.4375, 0.4375, 0.125, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0, 0.5},
			{-0.375, -0.5, 0.375, 0.375, 0, 0.4375},
			{-0.1875, -0.5, 0.3125, 0.1875, 0, 0.375},
			{-0.4375, 0, 0.4375, 0.4375, 0.1875, 0.5},
			{-0.3125, 0, 0.375, 0.3125, 0.1875, 0.4375},
			{-0.125, 0, 0.3125, 0.125, 0.1875, 0.375},
			{-0.375, 0.1875, 0.4375, 0.375, 0.3125, 0.5},
			{-0.25, 0.1875, 0.375, 0.25, 0.3125, 0.4375},
			{-0.0625, 0.1875, 0.3125, 0.0625, 0.3125, 0.375},
			{-0.3125, 0.3125, 0.4375, 0.3125, 0.4375, 0.5},
			{-0.1875, 0.3125, 0.375, 0.1875, 0.4375, 0.4375},
			{-0.125, 0.4375, 0.4375, 0.125, 0.5, 0.5},
		},
	},
})



lib_node_shapes.register_shape("column_beam", {
	description = "Column Beam", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
})
lib_node_shapes.register_shape("column_beam_with_support", {
	description = "Column Beam with Support Column", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
		   {-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
		   {-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
		   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
		   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
		},
	},
})



lib_node_shapes.register_shape("column_pillar_075_width", {
	description = "Column Pillar Full Height 3/4 Width", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
})
lib_node_shapes.register_shape("column_pillar_050_width", {
	description = "Column Pillar Full Height 1/2 Width", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
})



lib_node_shapes.register_shape("column_pillar_with_curtain_wall_075_width", {
	description = "Column Pillar with Curtain Wall 3/4 Width", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
		connect_front = {
			{-0.1875, 0.0, -0.5,  0.1875, 0.5, -0.25}
		},
		connect_left = {
			{-0.5, 0.0, -0.1875, -0.25, 0.5,  0.1875}
		},
		connect_back = {
			{-0.1875, 0.0,  0.25,  0.1875, 0.5,  0.5}
		},
		connect_right = {
			{ 0.25, 0.0, -0.1875,  0.5, 0.5,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
})
lib_node_shapes.register_shape("column_pillar_with_curtain_wall_050_width", {
	description = "Column Pillar with Curtain Wall 1/2 Width", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
		connect_front = {
			{-0.1875, 0.0, -0.5,  0.1875, 0.5, -0.25}
		},
		connect_left = {
			{-0.5, 0.0, -0.1875, -0.25, 0.5,  0.1875}
		},
		connect_back = {
			{-0.1875, 0.0,  0.25,  0.1875, 0.5,  0.5}
		},
		connect_right = {
			{ 0.25, 0.0, -0.1875,  0.5, 0.5,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
})



lib_node_shapes.register_shape("column_pillar_with_half_wall_075_width", {
	description = "Column Pillar with Half Wall 3/4 Width", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
		connect_front = {
			{-0.1875, -0.5, -0.5,  0.1875, 0.0, -0.25}
		},
		connect_left = {
			{-0.5, -0.5, -0.1875, -0.25, 0.0,  0.1875}
		},
		connect_back = {
			{-0.1875, -0.5,  0.25,  0.1875, 0.0,  0.5}
		},
		connect_right = {
			{ 0.25, -0.5, -0.1875,  0.5, 0.0,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
})
lib_node_shapes.register_shape("column_pillar_with_half_wall_050_width", {
	description = "Column Pillar with Half Wall 1/2 Width", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
		connect_front = {
			{-0.1875, -0.5, -0.5,  0.1875, 0.0, -0.25}
		},
		connect_left = {
			{-0.5, -0.5, -0.1875, -0.25, 0.0,  0.1875}
		},
		connect_back = {
			{-0.1875, -0.5,  0.25,  0.1875, 0.0,  0.5}
		},
		connect_right = {
			{ 0.25, -0.5, -0.1875,  0.5, 0.0,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
})



lib_node_shapes.register_shape("column_pillar_with_full_wall_075_width", {
	description = "Column Pillar with Full Wall 3/4 Width", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
		connect_front = {
			{-0.1875, -0.5, -0.5,  0.1875, 0.5, -0.375}
		},
		connect_left = {
			{-0.5, -0.5, -0.1875, -0.375, 0.5,  0.1875}
		},
		connect_back = {
			{-0.1875, -0.5,  0.375,  0.1875, 0.5,  0.5}
		},
		connect_right = {
			{ 0.375, -0.5, -0.1875,  0.5, 0.5,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
})
lib_node_shapes.register_shape("column_pillar_with_full_wall_050_width", {
	description = "Column Pillar with Full Wall 1/2 Width", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
		connect_front = {
			{-0.1875, -0.5, -0.5,  0.1875, 0.5, -0.25}
		},
		connect_left = {
			{-0.5, -0.5, -0.1875, -0.25, 0.5,  0.1875}
		},
		connect_back = {
			{-0.1875, -0.5,  0.25,  0.1875, 0.5,  0.5}
		},
		connect_right = {
			{ 0.25, -0.5, -0.1875,  0.5, 0.5,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
})


