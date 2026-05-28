local nauvis_map_gen = data.raw.planet.nauvis.map_gen_settings
local technology = data.raw.technology
local recipe = data.raw.recipe

data.raw.planet.vulcanus.map_gen_settings = nil
data.raw.planet.fulgora.map_gen_settings = nil

nauvis_map_gen.autoplace_controls["scrap"] = {}
nauvis_map_gen.autoplace_controls["calcite"] = {}
nauvis_map_gen.autoplace_controls["tungsten_ore"] = {}

nauvis_map_gen.autoplace_settings.entity.settings["scrap"] = {}
nauvis_map_gen.autoplace_settings.entity.settings["calcite"] = {}
nauvis_map_gen.autoplace_settings.entity.settings["tungsten-ore"] = {}

nauvis_map_gen.property_expression_names["entity:calcite:probability"] = "vulcanus_calcite_probability"
nauvis_map_gen.property_expression_names["entity:calcite:richness"] = "vulcanus_calcite_richness"
nauvis_map_gen.property_expression_names["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability"
nauvis_map_gen.property_expression_names["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness"

data.raw["space-location"]["fulgora"].hidden = true
data.raw["space-location"]["vulcanus"].hidden = true

data.raw["tips-and-tricks-item"]["fulgora-briefing"] = nil
data.raw["tips-and-tricks-item"]["vulcanus-briefing"] = nil

technology["foundation"].enabled = false
technology["lightning-collector"].enabled = false
technology["planet-discovery-fulgora"].enabled = false
technology["rail-support-foundations"].enabled = false
technology["planet-discovery-vulcanus"].enabled = false

technology["foundation"].hidden = true
technology["lightning-collector"].hidden = true
technology["planet-discovery-fulgora"].hidden = true
technology["rail-support-foundations"].hidden = true
technology["planet-discovery-vulcanus"].hidden = true

technology["recycling"].prerequisites = {"production-science-pack", "low-density-structure", "processing-unit", "concrete"}
technology["calcite-processing"].prerequisites = {"production-science-pack", "low-density-structure", "processing-unit", "concrete"}
technology["tungsten-carbide"].prerequisites = {"production-science-pack", "low-density-structure", "processing-unit", "concrete"}

technology["recycling"].research_trigger = {type = "mine-entity", entity = "scrap", count = 1}
technology["tungsten-carbide"].research_trigger = {type = "mine-entity", entity = "tungsten-ore", count = 1}

recipe["scrap-recycling"].results = {
	{type = "item", name = "holmium-ore", amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false}
}

recipe["foundation"].enabled = false
recipe["lightning-collector"].enabled = false
recipe["lightning-rod"].enabled = false
recipe["rail-support-foundations"].enabled = false
recipe["acid-neutralisation"].enabled = false
recipe["molten-copper-from-lava"].enabled = false
recipe["molten-iron-from-lava"].enabled = false
recipe["steam-condensation"].enabled = false

recipe["foundation"].hidden = true
recipe["lightning-collector"].hidden = true
recipe["lightning-rod"].hidden = true
recipe["rail-support-foundations"].hidden = true
recipe["acid-neutralisation"].hidden = true
recipe["molten-copper-from-lava"].hidden = true
recipe["molten-iron-from-lava"].hidden = true
recipe["steam-condensation"].hidden = true

recipe["electromagnetic-plant"].surface_conditions = nil
recipe["electromagnetic-science-pack"].surface_conditions = nil
recipe["recycler"].surface_conditions = nil
recipe["big-mining-drill"].surface_conditions = nil
recipe["foundry"].surface_conditions = nil
recipe["metallurgic-science-pack"].surface_conditions = nil
recipe["turbo-splitter"].surface_conditions = nil
recipe["turbo-transport-belt"].surface_conditions = nil
recipe["turbo-underground-belt"].surface_conditions = nil

for _, item in pairs(data.raw["item"]) do
	if item.default_import_location == "vulcanus" or item.default_import_location == "fulgora" then
		item.default_import_location = "nauvis"
	end
end
