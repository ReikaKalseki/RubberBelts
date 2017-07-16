require "config"

require("prototypes.rubber")

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
		requester_paste_multiplier = 20
	  },
	})
end