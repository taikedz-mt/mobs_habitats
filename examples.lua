
-- ethereal biomes

mobsbiomes:add_biome("ethereal:firepits",{
	floors = {"ethereal:fiery_dirt"},
	plants = {"ethereal:dry_shrub"},
	walls = {"default:obsidian"},
})

mobsbiomes:add_biome("ethereal:bamboo",{
	floors = "ethereal:bamboo_dirt",
	trees = "ethereal:bamboo",
	plants = "ethereal:bush",
})

-- spawning example


if minetest.get_modpath("dmobs") then
	mobsbiomes:add_spawn("dmobs:panda","ethereal:bamboo") -- use default spawning values from mobsbiomes
end

if minetest.get_modpath("mobs_monster") then
	mobsbiomes:add_family("firemonsters",{
		lavaflan = {mobstring="mobs_monster:lavaflan",spawnon="floors",spawnby="walls"},
		dungeonmaster = {mobstring="mobs_monster:dungeon_master",spawnon="floors",spawnby="walls",max_light=10},
	})

	mobsbiomes:add_family("groundmonsters",{
		oerkki = {mobstring="mobs_monster:oerkki",spawnon="floors",spawnby="walls"},
		stonemonster = {mobstring="mobs_monster:stone_monster",spawnon="floors",spawnby="walls"},
	})

	mobsbiomes:add_family_spawn("firemonsters","ethereal:firepits")
	mobsbiomes:add_family_spawn("groundmonsters","ethereal:firepits")
	mobsbiomes:add_family_spawn("groundmonsters","default:caves")
end
