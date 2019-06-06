require "config"

local function redirectTexture(entry)
	entry.filename = "__RubberBelts__/graphics/entity/transport-belt.png"
	if entry.hr_version then
		entry.hr_version.filename = "__RubberBelts__/graphics/entity/hr-transport-belt.png"
	end
	for k,v in pairs(entry) do
		if k == "filename" then
			entry.filename = "__RubberBelts__/graphics/entity/transport-belt.png"
		elseif k == "hr_version" then
			v.filename = "__RubberBelts__/graphics/entity/hr-transport-belt.png"
		elseif type(v) == "table" then
			redirectTexture(v)
		end
	end
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
			order = "f[wood]-f[wood-1-2]",
			stack_size = 100,
			fuel_category = "chemical",
			fuel_value = data.raw.item["wood"].fuel_value,
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
	redirectTexture(belt.belt_animation_set)
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