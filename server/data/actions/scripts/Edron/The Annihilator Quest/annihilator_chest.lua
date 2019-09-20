-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 10010 then
   		queststatus = getPlayerStorageValue(cid,10010)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Demon Armor.")
   			doPlayerAddItem(cid,2494,1)
   			setPlayerStorageValue(cid,10010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
   	elseif item.uid == 10011 then
   		queststatus = getPlayerStorageValue(cid,10010)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Sword of Valor.")
   			doPlayerAddItem(cid,2400,1)
   			setPlayerStorageValue(cid,10010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
   	elseif item.uid == 10012 then
   		queststatus = getPlayerStorageValue(cid,10010)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Stonecutter's Axe.")
   			doPlayerAddItem(cid,2431,1)
   			setPlayerStorageValue(cid,10010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
   	elseif item.uid == 10013 then
   		queststatus = getPlayerStorageValue(cid,10010)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Present.")
   			present = doPlayerAddItem(cid, 1990, 1)
            doAddContainerItem(present, 2326, 1)
   			setPlayerStorageValue(cid,10010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
	else
		return 0
   	end

   	return 1
end