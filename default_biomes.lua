-- Main land

mobsbiomes:add_biome("default:grasslands",{
	floors = {"default:dirt_with_grass","ethereal:green_dirt"},
	plants = {"group:flowers","default:grass_1","default:grass_2","default:grass_3","default:grass_4","default:grass_5","default:grass_6","default:grass_7",},
})

mobsbiomes:add_biome("default:snowymountains",{
	floors = {"default:dirt_with_snow","default:snow"},
	plants = "group:flowers",
	walls = "default:stone",
})

mobsbiomes:add_biome("default:desert",{
	floors = "default:desert_sand",
	walls = "default:stone_desert",
	trees = "default:cactus",
	plants = "default:dry_shrub",
})

mobsbiomes:add_biome("default:savannah",{
	floors = "default:dirt_with_dry_grass",
	plants = {"default:dry_grass_1","default:dry_grass_2","default:dry_grass_3","default:dry_grass_4","default:dry_grass_5","default:dry_grass_6","default:dry_grass_7",},
	trees = "default:acacia_tree",
	walls = "default:acacia_tree",
})

mobsbiomes:add_biome("default:icesea",{
	floors = {"default:ice"},
	plants = {"default:snow"}, -- snow covering?
})

-- Maritime

mobsbiomes:add_biome("default:shore",{
	floors = "default:sand",
})

mobsbiomes:add_biome("default:sea",{
	floors = "default:water_source",
	plants = "default:water_source",
	walls = "default:water_source",
	trees = "default:water_source",
})

mobsbiomes:add_biome("default:seabed",{
	floors = {"default:sand","default:dirt","default:clay"},
	plants = "default:water_source",
	walls = "default:water_source",
	trees = "default:water_source",
})

-- Forest types

mobsbiomes:add_biome("default:forest",{
	floors = {"default:dirt_with_grass","ethereal:green_dirt"},
	plants = {"group:flowers"},
	trees = {"default:tree","default:aspen"},
})

mobsbiomes:add_biome("default:pineforest",{
	floors = {"default:dirt_with_snow","ethereal:cold_dirt","default:snow"},
	trees = {"default:pine"},
})

mobsbiomes:add_biome("default:jungle",{
	floors = {"default:dirt_with_grass","ethereal:jungle_dirt"},
	trees = {"default:jungletree"},
})

-- Underground

mobsbiomes:add_biome("default:caves",{
	floors = {"default:stone","default:gravel","default:sandstone"},
	walls = {"default:stone","default:gravel","default:sandstone"},
})

mobsbiomes:add_biome("default:tallcaves",{ -- typically should spawn on floor... which here is air.
	walls = {"default:stone","default:gravel","default:sandstone"},
})

mobsbiomes:add_biome("default:dungeon",{
	floors = {"default:cobble","default:mossycobble"},
	walls = {"default:cobble","default:mossycobble"},
})

-- Sky

mobsbiomes:add_biome("default:sky",{ -- empty, defaults to air for all properties
})
