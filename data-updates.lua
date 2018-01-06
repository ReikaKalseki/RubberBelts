require "config"

require("prototypes.rubber")
require "prototypes.crappybelt"

if not Config.replaceIronRecipe then
	data:extend(
	{
	  {
		type = "recipe",
		name = "rubber-transport-belt",
		ingredients =
		{
		  {"rubber", 2},
		  {data.raw.item["motor"] and "motor" or "iron-gear-wheel", 1} --AAI Industry compat
		},
		result = "transport-belt",
		result_count = 2,
		requester_paste_multiplier = 20,
		enabled = data.raw.technology["basic-logistics"] == nil,
	  },
	})
	

	if data.raw.technology["basic-logistics"] then --AAI Industry "basic logistics"
		table.insert(data.raw.technology["basic-logistics"].effects, {type = "unlock-recipe", recipe = "rubber-transport-belt"})
	end
end