function onStepIn(cid, item, pos, frompos)
	setPlayerStorageValue(cid, 81500, -1)
	cleanPlayerTaskTimer(cid)
	return TRUE
end
