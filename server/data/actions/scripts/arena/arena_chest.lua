function onUse(cid, item, frompos, item2, topos)
if item.uid == 7001 then
		if getPlayerStorageValue(cid,7001) == -1 then
			doPlayerSendTextMessage(cid,25,"You have chosen a golden gelmet, and Warlord access.")
			doPlayerAddItem(cid,2471,1)
			setPlayerStorageValue(cid,7000,1)
			setPlayerStorageValue(cid,7001,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	end
	return true
end