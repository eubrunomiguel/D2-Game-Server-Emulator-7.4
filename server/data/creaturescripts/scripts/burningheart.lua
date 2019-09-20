local pointsValue = 
{
	minLevel = 80,
	vocation = {1,1,2,3,2,2,3,6},
	level    = {20,2}  -- 2 points on each 20 level over 100
}

function onKill(cid, target, lastHit)
	if cid ~= target and isPlayer(target) then

		if getPlayerIp(cid) == getPlayerIp(target) then 
			return true
		end

		if getPlayerLevel(target) < pointsValue.minLevel then
			return true
		end

		local playerlevel = getPlayerLevel(target) - pointsValue.minLevel

		if playerlevel < 0 then
			return true
		end

		local multiplier = pointsValue.vocation[getPlayerVocation(target)]
		local bonuslevel = playerlevel / pointsValue.level[1]
		bonuslevel = math.ceil(bonuslevel)
		bonuslevel = (bonuslevel <= 0 and 1 or bonuslevel)
		bonuslevel = bonuslevel * pointsValue.level[2]
		local totalPoints = multiplier*bonuslevel

		item = doPlayerAddItem(cid,2353,1)
		doSetItemSpecialDescription(item,"This is the heart of "..getPlayerName(target).." killed at Level "..getPlayerLevel(target).." by "..getPlayerName(cid)..".")
		doSendMagicEffect(getCreaturePosition(cid),12)

		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have received ' .. totalPoints .. ' player killing points.')
		doAddAccountPkPoints(cid, totalPoints)

	end
	return true
end

