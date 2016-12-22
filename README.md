# Mobs Habitats

A helper mod for spawning collections of mobs into various Minetest habitats.

## Defining habitats

Habitats are defined by their floors, walls, trees and plants. Remember though - leaves can be a ceiling to a bear, but a floor to a bird. Define habitats from the point of view of mobs that would live there.

For example, a jungle could be defined like this:

	mobshabitats:add_habitat("default:jungle",{
		floors = "default:dirt_with_grass",
		trees = "default:jungle_tree",
		plants = "default:jungle_grass",
	})

Note that we did not define any walls - there aren't any, so this defaults automatically to air.

We can add outlandish habitats too:

	mobshabitats:add_habitat("ethereal:firepits",{
		floors = {"ethereal:fiery_dirt"},
		plants = {"ethereal:dry_shrub","ethereal:fire_flower"},
		walls = {"default:obsidian"},
	})

	mobshabitats:add_habitat("ethereal:bamboo",{
		floors = "ethereal:bamboo_dirt",
		trees = "ethereal:bamboo",
		plants = "ethereal:bush",
	})

## Adding mobs to habitats

You can add mobs to habitats using the default spawn values

	mobshabitats:add_spawn("dmobs:panda","ethereal:bamboo")

Or customize some of them

	mobshabitats:add_spawn("mobs_monster:dirtmonster","default:grasslands",{max_light=8})

## Defining groups of mobs

You can add multiple mobs to named groups - each mob needs a mobstring, and a `spawnon` and `spawnby` value each pointing to "floors","walls","trees", or "plants".

You can customize the spawn parameters too.

	mobshabitats:add_family("firemonsters",{
		{mobstring="mobs_monster:lavaflan",spawnon="floors",spawnby="walls"},

		{mobstring="mobs_monster:dungeon_master",spawnon="floors",spawnby="walls",max_light=10,chance=2000},
	})

	mobshabitats:add_family("groundmonsters",{
		{mobstring="mobs_monster:oerkki",spawnon="floors",spawnby="walls"},

		{mobstring="mobs_monster:stone_monster",spawnon="floors",spawnby="walls"},
	})

And spawn named groups to habitats:

	mobshabitats:add_family_spawn("firemonsters","ethereal:firepits")
	mobshabitats:add_family_spawn("groundmonsters","ethereal:firepits")
	mobshabitats:add_family_spawn("groundmonsters","default:caves")

## Predefined habitats

  * default:grasslands
  * default:snowymountains
  * default:desert
  * default:savannah
  * default:icesea
  * default:shore
  * default:sea
  * default:seabed
  * default:forest
  * default:pineforest
  * default:jungle
  * default:caves
  * default:tallcaves
  * default:dungeon
  * default:sky 

## Predefined spawn values

You can override any of the predefined spawn values by providing the corresponding parameter and value

	min_light       = 0
	max_light       = 20
	min_height      = -31000
	max_height      = 31000
	interval        = 1                 (how frequently to try)
	chance          = 1000              (the inverse chance of the spawn occurring)
	aoc             = 4                 (max entities in area, "active object count")
	day_toggle      = nil               (1= day only, 0= night-only, nil=anytime)
	on_spawn        = nil               (should be a function)

