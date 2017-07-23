require "config"

if Config.replaceIronRecipe then
	local recipe = data.raw.recipe["transport-belt"]
	if recipe.ingredients then
		recipe.ingredients = {
			  {"rubber", 2},
			  {data.raw.item["motor"] and "motor" or "iron-gear-wheel", 1} --AAI Industry
		}
	end
	if recipe.normal then
		recipe.normal.ingredients = {
			  {"rubber", 2},
			  {data.raw.item["motor"] and "motor" or "iron-gear-wheel", 1} --AAI Industry
		}
	end
	if recipe.expensive then
		recipe.expensive.ingredients = {
			  {"rubber", 2},
			  {data.raw.item["motor"] and "motor" or "iron-gear-wheel", 1} --AAI Industry
		}
	end
end