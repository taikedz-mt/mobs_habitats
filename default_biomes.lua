mobsbiomes:add_biome("default:grasslands",{
	floors = {"default:dirt_with_grass","ethereal:green_dirt"},
	plants = {"group:flowers"},
})

mobsbiomes:add_biome("default:forest",{
	floors = {"default:dirt_with_grass","ethereal:green_dirt"},
	plants = {"group:flowers"},
	trees = {"default:tree"},
})

mobsbiomes:add_biome("default:pineforest",{
	floors = {"default:dirt_with_snow","ethereal:cold_dirt"},
	trees = {"default:pine"},
})

mobsbiomes:add_biomes("default:seasurface",{
	floors = "default:water_source",
})

mobsbiomes:add_biomes("default:sea",{
	floors = "default:water_source",
	plants = "default:water_source",
	walls = "default:water_source",
	trees = "default:water_source",
})

mobsbiomes:add_biomes("default:seasurface",{
	floors = "default:water_source",
})

mobsbiomes:add_biomes("default:seabed",{
	floors = {"default:sand","default:dirt","default:clay"},
	plants = "default:water_source",
	walls = "default:water_source",
	trees = "default:water_source",
})

mobsbiomes:add_biome("default:jungle",{
	floors = {"default:dirt_with_grass","ethereal:jungle_dirt"},
	trees = {"default:jungletree"},
})

mobsbiomes:add_biome("default:caves",{
	floors = {"default:stone","default:gravel","default:sandstone"},
	walls = {"default:stone","default:gravel","default:sandstone"},
})

