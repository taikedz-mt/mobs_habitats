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

You can add mobs to habitats using the default spawn values - each mob needs a mobstring, and a `spawnon` and `spawnby` value each pointing to "floors","walls","trees", or "plants".

	mobshabitats:add_spawn("dmobs:panda","ethereal:bamboo", {spawnon="floors", spawnby="trees"})

Or customize some of them

	mobshabitats:add_spawn("mobs_monster:dirtmonster","default:grasslands",{spawnon="floors",spawnby="walls", max_light=8})

## Defining groups of mobs

You can add multiple mobs to named groups, and customize the spawn parameters too.

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
  * default:river
  * default:riverbed
  * default:seabed
  * default:forest
  * default:pineforest
  * default:jungle
  * default:caves
  * default:tallcaves
  * default:dungeon
  * default:lavapit
  * default:sky 

## Predefined spawn values

You can override any of the predefined spawn values by providing the corresponding parameter and value

	min_light       = 0
	max_light       = 20
	min_height      = -31000
	max_height      = 31000
	interval        = 10                (how frequently to try)
	chance          = 100000            (the inverse chance of the spawn occurring)
	aoc             = 4                 (max entities in area, "active object count")
	day_toggle      = nil               (1= day only, 0= night-only, nil=anytime)
	on_spawn        = nil               (should be a function)

## Calculating Chance

The chance of a mob appearing depends on:

* how common the blocks are in the neighbouring environs
* the `active_block_range`

The chance parameter in `mobshabitats` takes these heuristics into account, so that when the *abr* scales up, so do the spawn chances.

To make the spawning work better regardless of what the Active Block Range is set to, the `chance` parameter should be based on an abr of 1, that is, for any given player, there are only 4096 currently active blocks on which ABMs will run.

For most mobs, having a chance value of 2048 - 4096 will equate to roughly a 1-in-1 chance of a mob spawning at every iteration of the ABM (as set in `interval`).

So

	mobshabitat:add_spawn("mobs_animal:bunny", "default:grasslands",
		{spawnon="floors", spawnby="floors", interval=5,
		chance = 5 * 4096 -- <<===
		})

will run every 5 seconds, and on each run there will be roughly a 1-in-5 chance of a rabbit spawning somehwere within the active block range of a player. We use 4096 as the upper limit of what roughly would equate to 1-in-1 chance.

Prefer thus to express the chance as a `n * 4096` number when using mobshabitats - the API itself will adjust for the active block range.

### Reasoning

A "map block" consists of 16 x 16 x 16 nodes.

If the active block range is set to `1` then only the immediate block in which the player is will run ABMs.

If the *abr* is set to `2`, everything within a radius of 2 blocks from the player will run their ABMs -- that is, a `(2 * 16) ^3 = 3276` number of blocks.

If the *abr* is set to `3` (the default), then that is raised to `(3 * 16) ^ 3 = 110592`

These numbers rack up pretty fast - a geometric progression copmounded by an exponential.

If you consider spawning a bird, in the air, and the player is standing on the ground, then it is likely only half the space is filled with air. In the case of an *abr* set to `3`, we have `110592 / 2 = 55296`. This means that the chance of spawning a bird (when the `spawnon` is air and the `spawnby` is air) should be set to `55296` (or, `(abr * 16)^3 / 2`), if you want a bird to spawn anywhere a player is located (that is, a 1 in 1 chance); but if you change your ABR to `1` then this needs to be reduced to `4096`.

