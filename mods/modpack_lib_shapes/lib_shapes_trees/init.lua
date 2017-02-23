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



lib_node_shapes.register_shape("tree_root", {
	description = "Tree Root", 
	shape_type = "tree",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.5, 0.4375, -0.25, 0.5},
			{-0.5, -0.5, -0.4375, 0.5, -0.25, 0.4375},
			{-0.375, -0.25, -0.4375, 0.375, 0, 0.4375},
			{-0.4375, -0.25, -0.375, 0.4375, 0, 0.375},
			{-0.375, 0, -0.3125, 0.375, 0.5, 0.3125},
			{-0.3125, 0, -0.375, 0.3125, 0.5, 0.375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		},
	},

})

lib_node_shapes.register_shape("tree_roots_01", {
	description = "Tree Roots 01", 
	shape_type = "tree",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.25, 0.125, -0.125, 0.5},
			{0.125, -0.5, 0.125, 0.5, -0.375, 0.375},
			{-0.5, -0.5, 0, -0.375, -0.375, 0.125},
			{-0.5, -0.375, 0, -0.125, -0.25, 0.125},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.25, 0.125, -0.125, 0.5},
			{0.125, -0.5, 0.125, 0.5, -0.375, 0.375},
			{-0.5, -0.5, 0, -0.375, -0.375, 0.125},
			{-0.5, -0.375, 0, -0.125, -0.25, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.25, 0.125, -0.125, 0.5},
			{0.125, -0.5, 0.125, 0.5, -0.375, 0.375},
			{-0.5, -0.5, 0, -0.375, -0.375, 0.125},
			{-0.5, -0.375, 0, -0.125, -0.25, 0.125},
		},
	},

})

lib_node_shapes.register_shape("tree_roots_02", {
	description = "Tree Roots 02", 
	shape_type = "tree",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, 0, -0.125, -0.25, 0.5},
			{-0.125, -0.5, 0.25, 0.125, -0.375, 0.375},
			{-0.3125, -0.5, -0.0625, -0.0625, -0.375, 0.125},
			{0.0625, -0.5, 0.1875, 0.1875, -0.4375, 0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, 0, -0.125, -0.25, 0.5},
			{-0.125, -0.5, 0.25, 0.125, -0.375, 0.375},
			{-0.3125, -0.5, -0.0625, -0.0625, -0.375, 0.125},
			{0.0625, -0.5, 0.1875, 0.1875, -0.4375, 0.4375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, 0, -0.125, -0.25, 0.5},
			{-0.125, -0.5, 0.25, 0.125, -0.375, 0.375},
			{-0.3125, -0.5, -0.0625, -0.0625, -0.375, 0.125},
			{0.0625, -0.5, 0.1875, 0.1875, -0.4375, 0.4375},
		},
	},

})


lib_node_shapes.register_shape("tree_branch", {
	description = "Tree Branch", 
	shape_type = "tree",
	node_box = {
		type = "connected",
		fixed = {
			{-0.125, -0.0625, -0.0625, 0.125, 0.0625, 0.0625}, -- Base_x
			{-0.0625, -0.125, -0.0625, 0.0625, 0.125, 0.0625}, -- Base_y
			{-0.0625, -0.0625, -0.125, 0.0625, 0.0625, 0.125}, -- Base_z
		},
		connect_front = {
			{-0.125, -0.0625, -0.5, 0.125, 0.0625, -0.0625}, -- Front_h_zneg
			{-0.0625, -0.125, -0.5, 0.0625, 0.125, -0.0625}, -- Front_v_zneg
		},
		connect_back = {
			{-0.125, -0.0625, 0.0625, 0.125, 0.0625, 0.5}, -- Back_h_zpos
			{-0.0625, -0.125, 0.0625, 0.0625, 0.125, 0.5}, -- Back_v_zpos
		},
		connect_left = {
			{-0.5, -0.0625, -0.125, -0.0625, 0.0625, 0.125}, -- Left_h_xneg
			{-0.5, -0.125, -0.0625, -0.0625, 0.125, 0.0625}, -- Left_v_xneg
		},
		connect_right = {
			{0.0625, -0.0625, -0.125, 0.5, 0.0625, 0.125}, -- Right_h_xpos
			{0.0625, -0.125, -0.0625, 0.5, 0.125, 0.0625}, -- Right_v_xpos
		},
		connect_bottom = {
			{-0.125, -0.5, -0.0625, 0.125, -0.0625, 0.0625}, -- Bottom_x_yneg
			{-0.0625, -0.5, -0.125, 0.0625, -0.0625, 0.125}, -- Bottom_z_yneg
		},
		connect_top = {
			{-0.125, 0.0625, -0.0625, 0.125, 0.5, 0.0625}, -- Top_x_ypos
			{-0.0625, 0.0625, -0.125, 0.0625, 0.5, 0.125}, -- Top_z_ypos
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.0625, -0.0625, 0.125, 0.0625, 0.0625}, -- Base_x
			{-0.0625, -0.125, -0.0625, 0.0625, 0.125, 0.0625}, -- Base_y
			{-0.0625, -0.0625, -0.125, 0.0625, 0.0625, 0.125}, -- Base_z
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})


lib_node_shapes.register_shape("tree_trunk_large", {
	description = "Tree Trunk (Large)", 
	shape_type = "tree",
	node_box = {
		type = "connected",
		fixed = {
			{-0.3125, -0.5, -0.25, 0.3125, 0.1875, 0.25}, -- BaseX
			{-0.25, -0.5, -0.3125, 0.25, 0.1875, 0.3125}, -- BaseZ
		},
		connect_top = {
			{-0.3125, 0.1875, -0.25, 0.3125, 0.5, 0.25}, -- ConnectTopX
			{-0.25, 0.1875, -0.3125, 0.25, 0.5, 0.3125}, -- ConnectTopZ
		},
		connect_front = {
			{-0.125, -0.1875, -0.5, 0.125, 0.1875, -0.3125}, -- ConnectFrontY_zneg
			{-0.1875, -0.125, -0.5, 0.1875, 0.125, -0.3125}, -- ConnectFrontZ_zneg
		},
		connect_back = {
			{-0.125, -0.1875, 0.3125, 0.125, 0.1875, 0.5}, -- ConnectBackY_zpos
			{-0.1875, -0.1875, 0.3125, 0.1875, 0.1875, 0.5}, -- ConnectBackZ_zpos
		},
		connect_left = {
			{-0.5, -0.125, -0.1875, -0.3125, 0.125, 0.1875}, -- ConnectLeftX_xneg
			{-0.5, -0.1875, -0.125, -0.3125, 0.1875, 0.125}, -- ConnectLeftZ_xneg
		},
		connect_right = {
			{0.3125, -0.1875, -0.125, 0.5, 0.1875, 0.125}, -- ConnectRightX_xpos
			{0.3125, -0.125, -0.1875, 0.5, 0.125, 0.1875}, -- ConnectRightZ_xpos
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.25, 0.3125, 0.1875, 0.25}, -- BaseX
			{-0.25, -0.5, -0.3125, 0.25, 0.1875, 0.3125}, -- BaseZ
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})

lib_node_shapes.register_shape("tree_trunk_medium", {
	description = "Tree Trunk (Medium)", 
	shape_type = "tree",
	node_box = {
		type = "connected",
		fixed = {
			{-0.25, -0.5, -0.1875, 0.25, 0.1875, 0.1875}, -- BaseX
			{-0.1875, -0.5, -0.25, 0.1875, 0.1875, 0.25}, -- BaseZ
		},
		connect_top = {
			{-0.25, 0.1875, -0.1875, 0.25, 0.5, 0.1875}, -- ConnectTopX
			{-0.1875, 0.1875, -0.25, 0.1875, 0.5, 0.25}, -- ConnectTopZ
		},
		connect_front = {
			{-0.125, -0.1875, -0.5, 0.125, 0.1875, -0.25}, -- ConnectFrontY_zneg
			{-0.1875, -0.125, -0.5, 0.1875, 0.125, -0.25}, -- ConnectFrontZ_zneg
		},
		connect_back = {
			{-0.125, -0.1875, 0.25, 0.125, 0.1875, 0.5}, -- ConnectBackY_zpos
			{-0.1875, -0.1875, 0.25, 0.1875, 0.1875, 0.5}, -- ConnectBackZ_zpos
		},
		connect_left = {
			{-0.5, -0.125, -0.1875, -0.25, 0.125, 0.1875}, -- ConnectLeftX_xneg
			{-0.5, -0.1875, -0.125, -0.25, 0.1875, 0.125}, -- ConnectLeftZ_xneg
		},
		connect_right = {
			{0.25, -0.1875, -0.125, 0.5, 0.1875, 0.125}, -- ConnectRightX_xpos
			{0.25, -0.125, -0.1875, 0.5, 0.125, 0.1875}, -- ConnectRightZ_xpos
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.1875, 0.25, 0.1875, 0.1875}, -- BaseX
			{-0.1875, -0.5, -0.25, 0.1875, 0.1875, 0.25}, -- BaseZ
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})

lib_node_shapes.register_shape("tree_trunk_small", {
	description = "Tree Trunk (Small)", 
	shape_type = "tree",
	node_box = {
		type = "connected",
		fixed = {
			{-0.1875, -0.5, -0.125, 0.1875, 0.1875, 0.125}, -- BaseX
			{-0.125, -0.5, -0.1875, 0.125, 0.1875, 0.1875}, -- BaseZ
		},
		connect_top = {
			{-0.1875, 0.1875, -0.125, 0.1875, 0.5, 0.125}, -- ConnectTopX
			{-0.125, 0.1875, -0.1875, 0.125, 0.5, 0.1875}, -- ConnectTopZ
		},
		connect_front = {
			{-0.0625, -0.125, -0.5, 0.0625, 0.125, -0.1875}, -- ConnectFrontY_zneg
			{-0.125, -0.0625, -0.5, 0.125, 0.0625, -0.1875}, -- ConnectFrontZ_zneg
		},
		connect_back = {
			{-0.0625, -0.125, 0.1875, 0.0625, 0.125, 0.5}, -- ConnectBackY_zpos
			{-0.125, -0.0625, 0.1875, 0.125, 0.0625, 0.5}, -- ConnectBackZ_zpos
		},
		connect_left = {
			{-0.5, -0.0625, -0.125, -0.1875, 0.0625, 0.125}, -- ConnectLeftX_xneg
			{-0.5, -0.125, -0.0625, -0.1875, 0.125, 0.0625}, -- ConnectLeftZ_xneg
		},
		connect_right = {
			{0.1875, -0.0625, -0.125, 0.5, 0.0625, 0.125}, -- ConnectRightX_xpos
			{0.1875, -0.125, -0.0625, 0.5, 0.125, 0.0625}, -- ConnectRightZ_xpos
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.125, 0.1875, 0.1875, 0.125}, -- BaseX
			{-0.125, -0.5, -0.1875, 0.125, 0.1875, 0.1875}, -- BaseZ
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})

