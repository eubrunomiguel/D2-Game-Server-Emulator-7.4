local function addEventLoot(cid, pos)
	local itemReward = 2366
	local chanceReward = 7
	local isLucky =  math.random(100) <= chanceReward
	local corpse = getTileItemByType(pos, ITEM_TYPE_CONTAINER).uid
	local ret = isContainer(corpse)
	if ret then
		if isLucky then
			doAddContainerItem(corpse, itemReward)
			doCreatureSay(cid, "Lucky Dude!", TALKTYPE_ORANGE_1)
		end
	end
 end
 
function onKill(cid, target, lastHit)
	if not isPlayer(target) and lastHit then
		addEvent(addEventLoot, 0, cid, getThingPos(target))
	end
	return true
end

