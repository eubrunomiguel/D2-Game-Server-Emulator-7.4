function onSay(cid, words, param, channel)
		pid = getPlayerByNameWildcard(param)
	doPlayerAddExp(pid, 80000)
	return true
end