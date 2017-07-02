require "config"

require("prototypes.overrides")
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
		  {"iron-gear-wheel", 1}
		},
		result = "transport-belt",
		result_count = 2,
		requester_paste_multiplier = 20
	  },
	})
end