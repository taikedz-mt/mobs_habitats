local function variant(base, variations, append)
	local newitems = {}
	if not append then append = {} end

	for _,v in pairs(append) do
		newitems[#newitems+1] = v
	end

	for _,v in pairs(variations) do
		newitems[#newitems+1] = base..v
	end

	return newitems
end

-- Main land

mobshabitats:add_habitat("default:grasslands",{
	floors = {"default:dirt_with_grass","ethereal:green_dirt"},
	plants = variant("default:grass_", {1,2,3,4,5,6,7}, {"group:flower"}),
})

mobshabitats:add_habitat("default:snowymountains",{
	floors = {"default:dirt_with_snow","default:snow","default:snowblock"},
	plants = "group:flower",
	walls = {"default:stone","default:dirt_with_snow"},
})

mobshabitats:add_habitat("default:desert",{
	floors = "default:desert_sand",
	walls = "default:stone_desert",
	trees = "default:cactus",
	plants = "default:dry_shrub",
})

mobshabitats:add_habitat("default:savannah",{
	floors = "default:dirt_with_dry_grass",
	plants = variant("default:dry_grass_", {1,2,3,4,5,6,7}),
	trees = "default:acacia_tree",
	walls = "default:acacia_tree",
})

mobshabitats:add_habitat("default:icesea",{
	floors = {"default:ice"},
	plants = {"default:snow"}, -- snow covering?
})

-- Maritime

mobshabitats:add_habitat("default:shore",{
	floors = "default:sand",
	walls = {"default:dirt_with_grass", "default:dirt_with_snow", "default:dirt"},
	plants = variant("default:grass_", {1,2,3,4,5,6,7}),
})

mobshabitats:add_habitat("default:sea",{
	floors = "default:water_source",
	plants = "default:water_source",
	walls = "default:water_source",
	trees = "default:water_source",
})

mobshabitats:add_habitat("default:seabed",{
	floors = {"default:sand","default:dirt","default:clay"},
	plants = "default:water_source",
	walls = "default:water_source",
	trees = "default:water_source",
})

-- Rivers

mobshabitats:add_habitat("default:river",{
	floors = {"default:river_water_source", "default:river_water_flowing"},
	plants = {"default:river_water_source", "default:river_water_flowing"},
	walls = {"default:river_water_source", "default:river_water_flowing"},
	trees = {"default:river_water_source", "default:river_water_flowing"},
})

mobshabitats:add_habitat("default:riverbed",{
	floors = {"default:dirt", "default:stone", "default:sand"},
	plants = {"default:river_water_source", "default:river_water_flowing"},
	walls = {"default:river_water_source", "default:river_water_flowing"},
	trees = {"default:river_water_source", "default:river_water_flowing"},
})

-- Forest types

mobshabitats:add_habitat("default:forest",{
	floors = {"default:dirt_with_grass","ethereal:green_dirt"},
	plants = {"group:flower"},
	trees = {"default:tree","default:aspen"},
})

mobshabitats:add_habitat("default:pineforest",{
	floors = {"default:dirt_with_snow","ethereal:cold_dirt","default:snow"},
	trees = {"default:pine"},
	plants = {"default:grass"},
})

mobshabitats:add_habitat("default:jungle",{
	floors = {"default:dirt_with_grass","ethereal:jungle_dirt"},
	trees = {"default:jungletree"},
	plants = {"default:junglegrass"},
})

-- Underground

mobshabitats:add_habitat("default:caves",{
	floors = {"default:stone","default:desert_stone","default:gravel","default:sandstone"},
	walls = {"default:stone","default:desert_stone","default:gravel","default:sandstone"},
})

mobshabitats:add_habitat("default:tallcaves",{ -- typically should spawn on floor... which here is air.
	walls = {"default:stone","default:desert_stone","default:gravel","default:sandstone"},
})

mobshabitats:add_habitat("default:dungeon",{
	floors = {"default:cobble","default:mossycobble", "default:sandstonebrick"},
	walls = {"default:cobble","default:mossycobble", "default:sandstonebrick"},
	plants = {"default:torch"}, -- when player starts placing torches ;-)
})

mobshabitats:add_habitat("default:lavapit",{
	floors = {"default:lava_source","default:lava_flowing"}
})

-- Sky

mobshabitats:add_habitat("default:sky",{ -- empty, defaults to air for all properties
})
