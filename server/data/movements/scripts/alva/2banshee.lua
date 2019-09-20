function onStepIn(cid, item, pos)
local pos = {x = 33273, y = 32182, z = 8}
    local heart = 2353
	item1 = {x = 33327, y = 32132, z = 8, stackpos=1}
	item2 = {x = 33327, y = 32133, z = 8, stackpos=1}
	item3 = {x = 33327, y = 32134, z = 8, stackpos=1}
	
if item.actionid == 5667 then
if getTileItemById(item1, heart).uid > 0 then
if getTileItemById(item2, heart).uid > 0 then
if getTileItemById(item3, heart).uid > 0 then
doRemoveItem(getTileItemById(item1, heart).uid,1)
doRemoveItem(getTileItemById(item2, heart).uid,1)
doRemoveItem(getTileItemById(item3, heart).uid,1)
doTeleportThing(cid, pos)
        doSendMagicEffect(getCreaturePosition(cid),10)
        doPlayerSendTextMessage(cid,22,"Good luck!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 3 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 3 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 3 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 3 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 3 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 3 burning hearts!")
end
	return TRUE
end
