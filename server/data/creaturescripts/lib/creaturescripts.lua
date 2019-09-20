function checkStageChange(cid)
	local active = isBonusActive()
	local value = (active and 2 or 1)
	
	local playerLevel = getPlayerLevel(cid)
	
	if (playerLevel > stages[#stages].maxLevel) then
		setExperienceRate(cid, stages[#stages].multiplier * value)
		return true
	end
	
	for i = 1, #stages do
		if (playerLevel >= stages[i].minLevel and playerLevel <= stages[i].maxLevel) then
			setExperienceRate(cid, stages[i].multiplier * value)
			return true
		end
	end
	
	return false
end