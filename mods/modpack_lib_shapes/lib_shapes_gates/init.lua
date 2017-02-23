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



lib_node_shapes.register_shape("fencegate_rail_centered", {
	description = "Fence Gate (Rail) Centered", 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.4375, 0.375, -0.0625, 0.375, 0.5, 0.0625}, -- TopRail_x
			{-0.4375, -0.375, -0.0625, 0.375, -0.25, 0.0625}, -- BottomRail_x
			{0.375, -0.375, -0.0625, 0.5, 0.5, 0.0625}, -- OuterSupport_y
			{-0.25, 0, -0.0625, 0.375, 0.125, 0.0625}, -- InnerRail_x
			{-0.375, -0.25, -0.0625, -0.25, 0.375, 0.0625}, -- HingeSupport_y
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.4375, 0.375, 0, -0.3125, 0.5, 0.875}, -- TopRail_x
			{-0.4375, -0.375, 0, -0.3125, -0.25, 0.875}, -- BottomRail_x
			{-0.4375, -0.375, 0.875, -0.3125, 0.5, 1.0}, -- OuterSupport_y
			{-0.4375, 0, 0.125, -0.3125, 0.125, 0.875}, -- InnerRail_x
			{-0.4375, -0.25, 0, -0.3125, 0.375, 0.125}, -- HingeSupport_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
})
lib_node_shapes.register_shape("fencegate_rail_centered_right", {
	description = "Fence Gate (Rail) Centered Right", 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{-0.375, 0.375, -0.0625, 0.4375, 0.5, 0.0625}, -- TopRail_x
			{-0.375, -0.375, -0.0625, 0.4375, -0.25, 0.0625}, -- BottomRail_x
			{-0.5, -0.375, -0.0625, -0.375, 0.5, 0.0625}, -- OuterSupport_y
			{-0.375, 0, -0.0625, 0.25, 0.125, 0.0625}, -- InnerRail_x
			{0.25, -0.25, -0.0625, 0.375, 0.375, 0.0625}, -- HingeSupport_y
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{0.3125, 0.375, 0, 0.4375, 0.5, 0.875}, -- TopRail_x
			{0.3125, -0.375, 0, 0.4375, -0.25, 0.875}, -- BottomRail_x
			{0.3125, -0.375, 0.875, 0.4375, 0.5, 1.0}, -- OuterSupport_y
			{0.3125, 0, 0.0625, 0.4375, 0.125, 0.875}, -- InnerRail_x
			{0.3125, -0.25, 0, 0.4375, 0.375, 0.125}, -- HingeSupport_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
})


lib_node_shapes.register_shape("fencegate_solid_centered", {
	description = "Fence Gate (Solid) Centered", 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.375, -0.375, -0.0625, 0.5, 0.4375, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.4375, -0.375, 0, -0.3125, 0.4375, 0.875},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
})
lib_node_shapes.register_shape("fencegate_solid_centered_right", {
	description = "Fence Gate (Solid) Centered Right", 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{-0.5, -0.375, -0.0625, 0.375, 0.4375, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{0.3125, -0.5, 0, 0.4375, 0.5, 0.875},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
})


