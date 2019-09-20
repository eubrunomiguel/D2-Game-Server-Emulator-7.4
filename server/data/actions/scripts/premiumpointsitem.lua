function onUse(cid, item, fromPosition, itemEx, toPosition)
	local points = 10
	if doRemoveItem(item.uid, 1) then
		doAddPoints(cid, points)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You received " .. points .. " premium points.")
    end
	return TRUE
end