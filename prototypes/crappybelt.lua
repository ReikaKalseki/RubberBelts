require "config"

local function redirectTexture(entry)
	entry.filename = "__RubberBelts__/graphics/entity/transport-belt.png"
	entry.hr_version.filename = "__RubberBelts__/graphics/entity/hr-transport-belt.png"
end

if Config.enableCrappyBelts then
	if not data.raw.item["wooden-gear"] then
		data:extend({
		  {
			type = "item",
			name = "wooden-gear",
			icon = "__RubberBelts__/graphics/icons/wood-gear.png",
			icon_size = 32,
			flags = {},
			subgroup = "intermediate-product",
			order = "f[raw-wood]-f[raw-wood-1-2]",
			stack_size = 100
		  },
		  {
			type = "recipe",
			name = "wood-gear",
			normal = {
				ingredients = {{"wood", 2}},
				result = "wooden-gear",
			},
			expensive = {
				ingredients = {{"wood", 4}},
				result = "wooden-gear",
			},
		  },
		})
	end
	
	local belt = table.deepcopy(data.raw["transport-belt"]["transport-belt"])
	belt.name = "wooden-belt"
	belt.icon = "__RubberBelts__/graphics/icons/transport-belt.png"
	belt.max_health = 80
	belt.resistances = nil
	--belt.animation_speed_coefficient = belt.animation_speed_coefficient/2
	belt.speed = belt.speed/2
	redirectTexture(belt.animations)
	redirectTexture(belt.belt_horizontal)
	redirectTexture(belt.belt_vertical)
	redirectTexture(belt.ending_top)
	redirectTexture(belt.ending_bottom)
	redirectTexture(belt.ending_side)
	redirectTexture(belt.belt_horizontal)
    redirectTexture(belt.starting_top)
    redirectTexture(belt.starting_bottom)
    redirectTexture(belt.starting_side)
	belt.minable.result = belt.name
	
	local item = table.deepcopy(data.raw.item["transport-belt"])
	item.place_result = belt.name
	item.name = belt.name
	item.icon = belt.icon
	
	local rec = {
		type = "recipe",
		name = belt.name,
		energy_required = 0.5,
		ingredients = {
			{"wooden-gear", 1},
			{"rubber", 2}
		},
		result = "wooden-belt",
		result_count = 2,
	}
	
	data:extend({
	item,
	belt,
	rec,
	})
end