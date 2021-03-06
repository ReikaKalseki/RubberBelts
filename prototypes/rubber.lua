if data.raw.item["resin"] then

else
	data:extend(
	{
	  {
		type = "item",
		name = "resin",
		icon = "__RubberBelts__/graphics/icons/resin.png",
		icon_size = 32,
		flags = {},
		subgroup = "intermediate-product",
		order = "f[wood]-f[wood-1-2]",
		stack_size = 200
	  },
	  {
		type = "recipe",
		name = "resin",
		--ingredients = {{"wood", 1}},
		--result = "resin",
		--result_count = 3
		normal = {
			ingredients = {{"wood", 1}},
			result = "resin",
			result_count = 3
		},
		expensive = {
			ingredients = {{"wood", 2}},
			result = "resin",
			result_count = 3
		},
	  }
	})
end

if data.raw.item["rubber"] then
	data.raw.item.rubber.icon = "__RubberBelts__/graphics/icons/rubber.png"
	data.raw.item.rubber.icon_size = 32
	data.raw.item.rubber.icon_mipmaps = 0
else
	data:extend(
	{
	  {
		type = "item",
		name = "rubber",
		icon = "__RubberBelts__/graphics/icons/rubber.png",
		icon_size = 32,
		flags = {},
		subgroup = "intermediate-product",
		order = "f[wood]-f[wood-1-2]",
		stack_size = 200
	  },
	  {
		type = "recipe",
		name = "rubber",
		category = "smelting",
		energy_required = 2.5,
		ingredients = {{"resin", 2}},
		result = "rubber"
	  }
	})
end