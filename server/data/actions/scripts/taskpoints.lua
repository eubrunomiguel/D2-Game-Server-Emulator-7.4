function onUse(cid, item, fromPosition, itemEx, toPosition)
local pontos = math.random(1,2)
doAddPoints(cid, pontos)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You received " .. pontos .. " premium points.")
                doRemoveItem(item.uid, 1)
	return TRUE
end