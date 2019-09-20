-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 6667 then
   		queststatus = getPlayerStorageValue(cid,6671)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Demon Legs.")
   			doPlayerAddItem(cid,2495,1)
   			setPlayerStorageValue(cid,6671,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
   	elseif item.uid == 6668 then
   		queststatus = getPlayerStorageValue(cid,6671)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Winged Helmet.")
   			doPlayerAddItem(cid,2474,1)
   			setPlayerStorageValue(cid,6671,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
   	elseif item.uid == 6669 then
   		queststatus = getPlayerStorageValue(cid,6671)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Blessed Shield.")
   			doPlayerAddItem(cid,2523,1)
   			setPlayerStorageValue(cid,6671,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
   	elseif item.uid == 6670 then
   		queststatus = getPlayerStorageValue(cid,6671)
   		if queststatus == -1 and getPlayerAccess(cid) == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found a Thunder Hammer.")
   			present = doPlayerAddItem(cid, 1990, 1)
            doAddContainerItem(present, 2421, 1)
   			setPlayerStorageValue(cid,6671,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The chest is empty.")
   		end
	else
		return 0
   	end

   	return 1
end