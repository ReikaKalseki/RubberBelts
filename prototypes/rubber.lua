if not data.raw.item["resin"] or not data.raw.item["rubber"] then

data:extend(
{
  {
    type = "item",
    name = "resin",
    icon = "__RubberBelts__/graphics/icons/resin.png",
	icon_size = 32,
    flags = {},
    subgroup = "intermediate-product",
    order = "f[raw-wood]-f[raw-wood-1-2]",
    stack_size = 200
  },
  {
    type = "item",
    name = "rubber",
    icon = "__RubberBelts__/graphics/icons/rubber.png",
	icon_size = 32,
    flags = {},
    subgroup = "intermediate-product",
    order = "f[raw-wood]-f[raw-wood-1-2]",
    stack_size = 200
  },
})

data:extend(
{
  {
    type = "recipe",
    name = "resin",
    --ingredients = {{"raw-wood", 1}},
    --result = "resin",
    --result_count = 3
	normal = {
		ingredients = {{"raw-wood", 1}},
		result = "resin",
		result_count = 3
	},
	expensive = {
		ingredients = {{"raw-wood", 2}},
		result = "resin",
		result_count = 3
	},
  },
  {
    type = "recipe",
    name = "rubber",
    category = "smelting",
    energy_required = 2.5,
    ingredients = {{"resin", 2}},
    result = "rubber"
  },
})

end