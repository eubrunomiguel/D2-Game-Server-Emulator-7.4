function onUse(cid, item, frompos, item2, topos)
if item.uid == 11000 then
		if getPlayerStorageValue(cid,11000) == -1 then
			doPlayerSendTextMessage(cid,22,"You have found ferumbras tower access key.")
			item = doPlayerAddItem(cid,2090,1)
			doSetItemActionId(item, 5020)
			setPlayerStorageValue(cid,11000,1)
		else
			doPlayerSendTextMessage(cid,22,"The chest is empty.")
		end
	end
	return true
end