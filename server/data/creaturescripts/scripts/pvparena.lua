local config = {
	points = 10,
    arena1from = {x = 32388, y = 32198, z = 7},
	arena1to = {x = 32390, y = 32200, z = 7},
	arena1tp = {x = 32388, y = 32198, z = 7},
	arena1tpto = {x = 32389, y = 32194, z = 7},
	
    arena2from = {x = 32392, y = 32198, z = 7},
	arena2to = {x = 32394, y = 32200, z = 7},
	arena2tp = {x = 32392, y = 32198, z = 7},
	arena2tpto = {x = 32392, y = 32194, z = 7},
	
	arena3from = {x = 32396, y = 32198, z = 7},
	arena3to = {x = 32398, y = 32200, z = 7},
	arena3tp = {x = 32396, y = 32198, z = 7},
	arena3tpto = {x = 32399, y = 32194, z = 7},
	
	arena4from = {x = 32400, y = 32198, z = 7},
	arena4to = {x = 32402, y = 32200, z = 7},
	arena4tp = {x = 32400, y = 32198, z = 7},
	arena4tpto = {x = 32402, y = 32194, z = 7},
	
    arena5from = {x = 32389, y = 32192, z = 7},
	arena5to = {x = 32392, y = 32196, z = 7},
	arena5tp = {x = 32389, y = 32192, z = 7},
	arena5tpto = {x = 32394, y = 32190, z = 7},
	
    arena6from = {x = 32399, y = 32192, z = 7},
	arena6to = {x = 32402, y = 32196, z = 7},
	arena6tp = {x = 32399, y = 32192, z = 7},
	arena6tpto = {x = 32397, y = 32190, z = 7},
	
	arena7from = {x = 32389, y = 32188, z = 7},
	arena7to = {x = 32402, y = 32190, z = 7},
	arena7tp = {x = 32394, y = 32190, z = 7},
	arena7tpto = {x = 32404, y = 32194, z = 7}
}

local function deleteTeleport(tp)
   local teleport = getTileItemById(tp, 1387).uid
   if(teleport > 0) then
     doRemoveItem(teleport)
     doSendMagicEffect(tp, CONST_ME_POFF)
   end
   return true
end

function onKill(cid, target)
	local tmp = getCreaturePosition(target)
	if(not isPlayer(target)) then
		return true
	end
	if(isInRange(tmp, {x = 32388, y = 32187, z = 7}, {x = 32402, y = 32200, z = 7}) == TRUE) then
		if(isInRange(tmp, config.arena1from, config.arena1to) == TRUE) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
			doCreateTeleport(1387, config.arena1tpto, config.arena1tp)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[PVPArena] You have defeated " .. getCreatureName(target) .. ".")
			addEvent(deleteTeleport, 60 * 1000, config.arena1tp)
		elseif(isInRange(tmp, config.arena2from, config.arena2to) == TRUE) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
			doCreateTeleport(1387, config.arena2tpto, config.arena2tp)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[PVPArena] You have defeated " .. getCreatureName(target) .. ".")
			addEvent(deleteTeleport, 60 * 1000, config.arena2tp)
		elseif(isInRange(tmp, config.arena3from, config.arena3to) == TRUE) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
			doCreateTeleport(1387, config.arena3tpto, config.arena3tp)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[PVPArena] You have defeated " .. getCreatureName(target) .. ".")
			addEvent(deleteTeleport, 60 * 1000, config.arena3tp)
		elseif(isInRange(tmp, config.arena4from, config.arena4to) == TRUE) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
			doCreateTeleport(1387, config.arena4tpto, config.arena4tp)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[PVPArena] You have defeated " .. getCreatureName(target) .. ".")
			addEvent(deleteTeleport, 60 * 1000, config.arena4tp)
		elseif(isInRange(tmp, config.arena5from, config.arena5to) == TRUE) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
			doCreateTeleport(1387, config.arena5tpto, config.arena5tp)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[PVPArena] You have defeated " .. getCreatureName(target) .. ".")
			addEvent(deleteTeleport, 60 * 1000, config.arena5tp)
		elseif(isInRange(tmp, config.arena6from, config.arena6to) == TRUE) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
			doCreateTeleport(1387, config.arena6tpto, config.arena6tp)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[PVPArena] You have defeated " .. getCreatureName(target) .. ".")
			addEvent(deleteTeleport, 60 * 1000, config.arena6tp)
		elseif(isInRange(tmp, config.arena7from, config.arena7to) == TRUE) then
			doAddPoints(cid, config.points)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[PVPArena] You have defeated everybody, and received " .. config.points .. " premium points.")
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
			doCreateTeleport(1387, config.arena7tpto, config.arena7tp)
			addEvent(deleteTeleport, 60 * 1000, config.arena7tp)
			setPlayerStorageValue(cid,7667,1)
		end
	end
   return true
end
