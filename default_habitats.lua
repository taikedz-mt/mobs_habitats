-- Main land

mobshabitats:add_habitat("default:grasslands",{
	floors = {"default:dirt_with_grass","ethereal:green_dirt"},
	plants = {"group:flowers","default:grass_1","default:grass_2","default:grass_3","default:grass_4","default:grass_5","default:grass_6","default:grass_7",},
})

mobshabitats:add_habitat("default:snowymountains",{
	floors = {"default:dirt_with_snow","default:snow"},
	plants = "group:flowers",
	walls = "default:stone",
})

mobshabitats:add_habitat("default:desert",{
	floors = "default:desert_sand",
	walls = "default:stone_desert",
	trees = "default:cactus",
	plants = "default:dry_shrub",
})

mobshabitats:add_habitat("default:savannah",{
	floors = "default:dirt_with_dry_grass",
	plants = {"default:dry_grass_1","default:dry_grass_2","default:dry_grass_3","default:dry_grass_4","default:dry_grass_5","default:dry_grass_6","default:dry_grass_7",},
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
	plants = {"group:flowers"},
	trees = {"default:tree","default:aspen"},
})

mobshabitats:add_habitat("default:pineforest",{
	floors = {"default:dirt_with_snow","ethereal:cold_dirt","default:snow"},
	trees = {"default:pine"},
})

mobshabitats:add_habitat("default:jungle",{
	floors = {"default:dirt_with_grass","ethereal:jungle_dirt"},
	trees = {"default:jungletree"},
})

-- Underground

mobshabitats:add_habitat("default:caves",{
	floors = {"default:stone","default:gravel","default:sandstone"},
	walls = {"default:stone","default:gravel","default:sandstone"},
})

mobshabitats:add_habitat("default:tallcaves",{ -- typically should spawn on floor... which here is air.
	walls = {"default:stone","default:gravel","default:sandstone"},
})

mobshabitats:add_habitat("default:dungeon",{
	floors = {"default:cobble","default:mossycobble"},
	walls = {"default:cobble","default:mossycobble"},
})

mobshabitats:add_habitat("default:lavapit",{
	floors = {"default:lava_source","default:lava_flowing"}
})

-- Sky

mobshabitats:add_habitat("default:sky",{ -- empty, defaults to air for all properties
})
