
function onStepIn(cid, item, pos)
	if not isPlayer(cid) then
		return true
	end
	if getPlayerStorageValue(cid, 7000) ~= 1 then
		doPlayerSendCancel(cid,"You do not have access to Ciganum.")
		pos.z = pos.z+1
		doCreatureAddHealth(cid, -getCreatureHealth(cid)/2)
		doTeleportThing(cid, pos)
		doSendMagicEffect(getPlayerPosition(cid), 15)
	end
	return true
end
