local config = {
    timeToRemove = 180, -- seconds
	message = "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room only during his time or the teleporter will disappear",
    teleportId = 1387,
    bosses = { -- Monster Name,  Teleport Position
            ["Ushuriel"] = {  pos={x = 33242, y = 31417, z = 11, stackpos=1}, aid=1001 },
			["Zugurosh"] = {  pos={x = 33212, y = 31414, z = 11, stackpos=1}, aid=1002},
			["Madareth"] = {  pos={x = 33170, y = 31428, z = 11, stackpos=1}, aid=1003},
            ["Annihilon"] = {  pos={x = 33260, y = 31430, z = 11, stackpos=1}, aid=1005},
            ["Hellgorak"] = {  pos={x = 33230, y = 31439, z = 11, stackpos=1}, aid=1006}
			},
	brothers ={
    ["Golgordan"] = {pos={x = 33199, y = 31436, z = 11, stackpos=1 },aid=1004, brother = "Latrivan"},
    ["Latrivan"] = {pos={x = 33199, y = 31436, z = 11, stackpos=1 },aid=1004, brother = "Golgordan"},
    brothersArea ={
            fromPos = {x = 33207, y = 31448, z = 11},
            toPos = {x = 33191, y = 31436, z = 11}	}	}
}

local function removal(teleport)
	doRemoveItem(teleport)
    return TRUE
end

function onKill(cid, target, lastHit)
    if(config.bosses[getCreatureName(target)]) then
		local t = config.bosses[getCreatureName(target)]
	    local teleport = doCreateItem(config.teleportId, t.pos)
		local position = t.pos
		doSetItemActionId(teleport, t.aid)
        doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
		addEvent(removal, config.timeToRemove * 1000, teleport)
	elseif(config.brothers[getCreatureName(target)]) then
		local t = config.brothers[getCreatureName(target)]
        local brother = getCreatureByName(t.brother)
		if(isMonster(brother) == true) then
            if(isInRange(getCreaturePosition(brother), config.brothers.brothersArea.fromPos, config.brothers.brothersArea.toPos) == true) then
                return TRUE
			end
        else
			local teleport = doCreateItem(config.teleportId, t.pos)
			local position = t.pos
					doSetItemActionId(teleport, t.aid)
			doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
			addEvent(removal, config.timeToRemove * 1000, position)
		end
	end
	return TRUE
end
