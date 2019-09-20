-- Include external classes.
dofile(getDataDir() .. 'npc/scripts/lib/npcsystem/npcsystem.lua')

-- Callback for isPremium(cid) so Jiddo's npcsystem works
isPlayerPremiumCallback = isPremium

-- move to a creature
function moveToCreature(id)
	if(isCreature(id) == FALSE) then
		debugPrint('moveToCreature(): creature not found.')
		return LUA_ERROR
	end

	local pos = getCreaturePosition(id)
	selfMoveTo(pos.x, pos.y, pos.z)
	return LUA_NO_ERROR
end

-- do one step to reach position
function moveToPosition(x,y,z)
	selfMoveTo(x, y, z)
end


-- stop talking
function selfGotoIdle()
		following = false
		attacking = false
		selfAttackCreature(0)
		target = 0
end

function getCount(msg)
	b, e = string.find(msg, "%d+")
	
	if b == nil or e == nil then
		count = 1
	else
		count = tonumber(string.sub(msg, b, e))
	end
	
	if count > 2000 then
		count = 2000
	end
	
	return count
end

function msgcontains(txt, str)
	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function msgcontains(message, keyword)
	local a, b = string.find(message, keyword)
	if a == nil or b == nil then
		return false
	end
	return true
end

function getCount(msg)
 local ret = -1
 local b, e = string.find(msg, "%d+")
    if b ~= nil and e ~= nil then
       ret = tonumber(string.sub(msg, b, e))
    end
 
    return ret
end
