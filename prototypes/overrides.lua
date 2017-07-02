require "config"

if Config.replaceIronRecipe then
	data.raw.recipe["transport-belt"].ingredients = {
		  {"rubber", 2},
		  {"iron-gear-wheel", 1}
	}
end