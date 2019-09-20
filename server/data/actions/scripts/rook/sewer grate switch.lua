isBridgeOpen = true
function onUse(cid, item, frompos, item2, topos)
    tile1 = {x = 32101, y = 32102, z = 8, stackpos = 1} 
    tile2 = {x = 32102, y = 32102, z = 8, stackpos = 1} 
	local playerTile = {x = 32101, y = 32102, z = 8} 
	local playerTile1 = {x = 32102, y = 32102, z = 8,} 
    gettile1 = getThingfromPos(tile1)
    gettile2 = getThingfromPos(tile2)
    if item.uid == 3009 and isBridgeOpen then 
         doCreateItem(493,1,tile1)
         doCreateItem(493,1,tile2)
         doCreateItem(4799,1,tile1)
         doCreateItem(4797,1,tile2)	
		 isBridgeOpen = false
    elseif item.uid == 3009 and not isBridgeOpen then
        doCreateItem(1284,1,tile1)
        doCreateItem(1284,1,tile2)
        doRemoveItem(gettile1.uid,1)
        doRemoveItem(gettile2.uid,1)     
		isBridgeOpen = true
    else
        doPlayerSendCancel(cid,"Sorry, not possible.")
    end
	
		if item.itemid == 1945 then
		doTransformItem(item.uid,item.itemid+1)
		elseif item.itemid == 1946 then
		doTransformItem(item.uid,item.itemid-1)  
		end
 
    return 1
end
