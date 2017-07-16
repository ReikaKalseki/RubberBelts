require "config"

if Config.replaceIronRecipe then
	data.raw.recipe["transport-belt"].ingredients = {
		  {"rubber", 2},
		  {data.raw.item["motor"] and "motor" or "iron-gear-wheel", 1} --AAI Industry
	}
end