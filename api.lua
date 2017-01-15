-- Mobs Biomes [mobshabitats]
-- (C) 2016 by Tai "DuCake" Kedzierski
-- Provided to you under the GNU Lesser General Public License v3.0
-- Please see LICENSE.txt for details
-- or refer to https://www.gnu.org/licenses/lgpl-3.0.txt

mobshabitats = {}
local habitatdefs = {}
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
		minetest.log("error","Bad habitat property definition")
	end
end

mobshabitats.add_habitat = function(self,habitatname,def)
	if habitatdefs[habitatname] then
		minetest.log("warning","Redefining habitat "..habitatname)
	end

	habitatdefs[habitatname] = {}

	habitatdefs[habitatname].floors = formatcheck(def.floors)
	habitatdefs[habitatname].walls = formatcheck(def.walls)
	habitatdefs[habitatname].trees = formatcheck(def.trees)
	habitatdefs[habitatname].plants = formatcheck(def.plants)
end

-- from -- Mobs Api (9th October 2016)
--function mobs:spawn_specific(name, nodes, neighbors, min_light, max_light,
--        interval, chance, aoc, min_height, max_height, day_toggle, on_spawn)


mobshabitats.add_spawn = function(self,mobstring,habitatstring,def)
	local fulldef = {}
	local habdef = habitatdefs[habitatstring]
	if not habdef then
		minetest.log("error", "No such habitat "..habitatstring.." for "..mobstring)
		return
	end
	if def == nil then def = {} end

	fulldef.nodes = habdef[def.spawnon] or "air"
	fulldef.neighbours = habdef[def.spawnby] or "air"
	fulldef.min_light = def.min_light or 0
	fulldef.max_light = def.max_light or 20
	fulldef.min_height = def.min_height or -31000
	fulldef.max_height = def.max_height or 31000
	fulldef.interval = def.interval or 10
	fulldef.chance = def.chance or 100000
	fulldef.aoc = def.aoc or 4
	fulldef.day_toggle = def.day_toggle
	fulldef.on_spawn = def.on_spawn

	if not fulldef.nodes or not fulldef.neighbours or not mobstring then
		minetest.log("error","Invalid habitat spawning for "..tostring(mobstring).." into "..tostring(habitatstring) )
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

mobshabitats.add_family = function(self,familyname,deflist)
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

mobshabitats.add_family_spawn = function(self,familyname,habitatname)
	local family = familydefs[familyname]
	--minetest.debug("Spawning "..dump(family))
	for mob,mobdef in pairs(family) do
		self:add_spawn(mobdef.mobstring,habitatname,mobdef)
	end
end
