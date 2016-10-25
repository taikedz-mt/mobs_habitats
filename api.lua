mobsbiomes = {}
local biomedefs = {}
local familydefs = {}

local tablecopy = function(mytable)
	-- need to define this, make a deep copy
	return mytable
end

local formatcheck = function(input)
	if type(input) == "string" then
		return {input}
	elseif type(input) == "table" then
		return input
	elseif type(input) == "nil" then
		return {"air"}
	else
		minetest.log("error","Bad biome property definition")
	end
end

mobsbiomes.add_biome = function(self,biomename,def)
	if biomedefs[biomename] then
		minetest.log("error","Biome "..biomename.." already exists.")
		return
	end

	biomedefs[biomename] = {}

	biomedefs[biomename].floors = formatcheck(def.floors)
	biomedefs[biomename].walls = formatcheck(def.walls)
	biomedefs[biomename].trees = formatcheck(def.trees)
	biomedefs[biomename].plants = formatcheck(def.plants)
end

-- from -- Mobs Api (9th October 2016)
--function mobs:spawn_specific(name, nodes, neighbors, min_light, max_light,
--        interval, chance, aoc, min_height, max_height, day_toggle, on_spawn)


mobsbiomes.add_spawn = function(self,mobstring,biomestring,def)
	local fulldef = {}
	if def == nil then def = {} end
	--minetest.debug("Using biome definition "..dump(biomedefs[biomestring]))
	fulldef.nodes = biomedefs[biomestring][def.spawnon]
	fulldef.neighbours = biomedefs[biomestring][def.spawnby]
	fulldef.min_light = def.min_light or 0
	fulldef.max_light = def.max_light or 20
	fulldef.min_height = def.min_height or -31000
	fulldef.max_height = def.max_height or 31000
	fulldef.interval = def.interval or 1
	fulldef.chance = def.chance or 1000
	fulldef.aoc = def.aoc or 4
	fulldef.deay_toggle = def.day_toggle
	fulldef.on_spawn = def.on_spawn

	if not fulldef.nodes or not fulldef.neighbours or not mobstring then
		minetest.log("error","Invalid biome spawning for "..tostring(mobstring).." into "..tostring(biomestring) )
		return
	end

	mobs:spawn_specific(
		mobstring,
		fulldef.nodes,
		fulldef.neighbours,
		fulldef.min_light,
		fulldef.max_light,
		fulldef.interval,
		fulldef.chance,
		fulldef.aoc,
		fulldef.min_height,
		fulldef.max_height,
		fulldef.day_toggle,
		fulldef.on_spawn
	)
end

mobsbiomes.add_family = function(self,familyname,deflist)
	familydefs[familyname] = {}
	--minetest.debug("Processing family "..familyname)

	for mob,mobdef in pairs(deflist) do
		familydefs[familyname][mob] = {}
		--minetest.debug("  Processing mob entry "..mob)
		for k,v in pairs(mobdef) do
			--minetest.debug("    Added value "..tostring(k).."->"..tostring(v).." for "..mob)
			familydefs[familyname][mob][k] = v
		end -- mobdef
	end -- deflist
end

mobsbiomes.add_family_spawn = function(self,familyname,biomename)
	local family = familydefs[familyname]
	--minetest.debug("Spawning "..dump(family))
	for mob,mobdef in pairs(family) do
		self:add_spawn(mobdef.mobstring,biomename,mobdef)
	end
end
