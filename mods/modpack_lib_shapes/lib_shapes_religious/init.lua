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



--[[lib_node_shapes.register_shape("marker_cross_01", {
	description = "Religious Marker Cross 01", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.0625, -0.375, -0.0625, 0.0625, 0.375, 0.0625},
			{-0.25, 0, -0.0625, 0.25, 0.125, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.3125, -0.375, -0.0625, 0.3125, 0.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.3125, -0.375, -0.0625, 0.3125, 0.5, 0.0625},
		},
	},
})
--]]

lib_node_shapes.register_shape("marker_cross_02", {
	description = "Religious Marker Cross 02", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.3125, 0.125, -0.0625, 0.3125, 0.25, 0.0625},
			{-0.0625, -0.375, -0.0625, 0.0625, 0.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.3125, -0.375, -0.0625, 0.3125, 0.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.3125, -0.375, -0.0625, 0.3125, 0.5, 0.0625},
		},
	},
})

--[[lib_node_shapes.register_shape("marker_tombstone_01", {
	description = "Religious Marker Tombstone_01", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, -0.375, 0.125},
			{-0.25, 0.375, -0.0625, 0.25, 0.5, 0.0625},
			{-0.375, -0.375, -0.0625, 0.375, 0.375, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.3125, -0.375, -0.0625, 0.3125, 0.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.375, 0.125},
			{-0.3125, -0.375, -0.0625, 0.3125, 0.5, 0.0625},
		},
	},
})
--]]

--[[lib_node_shapes.register_shape("pedastal_basic_01", {
	description = "Pedastal Basic 01", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox1
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.375}, -- NodeBox3
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox6
			{-0.4375, -0.375, -0.4375, 0.4375, -0.3125, 0.4375}, -- NodeBox9
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
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
--]]

lib_node_shapes.register_shape("tomb_basic_01", {
	description = "Tomb Basic 01", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 1.5}, -- NodeBox1
			{-0.375, -0.375, -0.375, 0.375, 0.375, 1.375}, -- NodeBox3
			{-0.4375, 0.25, -0.4375, 0.4375, 0.3125, 1.4375}, -- NodeBox6
			{-0.4375, -0.375, -0.4375, 0.4375, -0.3125, 1.4375}, -- NodeBox9
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 1.5}, -- NodeBox1
			{-0.4375, -0.375, -0.4375, 0.4375, 0.375, 1.4375}, -- NodeBox9
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 1.5}, -- NodeBox1
			{-0.4375, -0.375, -0.4375, 0.4375, 0.375, 1.4375}, -- NodeBox9
		},
	},
})

