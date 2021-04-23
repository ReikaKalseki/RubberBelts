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

local conv = createConversionRecipe("wooden-belt", "transport-belt", false, nil, true)
conv.enabled = true
data:extend({conv})

if data.raw.recipe["bob-resin-wood"] and Config.replaceIronRecipe then --his can normally only be made in an assembler, which is a problem if you need it for belts
	data.raw.recipe["bob-resin-wood"].category = "crafting"
end

if data.raw["assembling-machine"]["bob-greenhouse"] then --buff greenhouses for increased wood use
	data.raw["assembling-machine"]["bob-greenhouse"].crafting_speed = 1 --was 0.75, possibly unintentionally
	data.raw.recipe["bob-basic-greenhouse-cycle"].normal.energy_required = data.raw.recipe["bob-basic-greenhouse-cycle"].normal.energy_required*0.5
	data.raw.recipe["bob-basic-greenhouse-cycle"].expensive.energy_required = data.raw.recipe["bob-basic-greenhouse-cycle"].expensive.energy_required*0.5
	data.raw.recipe["bob-advanced-greenhouse-cycle"].normal.energy_required = data.raw.recipe["bob-advanced-greenhouse-cycle"].normal.energy_required*0.5
	data.raw.recipe["bob-advanced-greenhouse-cycle"].expensive.energy_required = data.raw.recipe["bob-advanced-greenhouse-cycle"].expensive.energy_required*0.5
end