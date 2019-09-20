function onStepIn(cid, item, pos)
local pos = {x = 33325, y = 32055, z = 8}
    local heart = 2353
	item1 = {x = 33320, y = 32054, z = 8, stackpos=1}
	item2 = {x = 33321, y = 32054, z = 8, stackpos=1}
	item3 = {x = 33322, y = 32054, z = 8, stackpos=1}
	item4 = {x = 33320, y = 32056, z = 8, stackpos=1}
	item5 = {x = 33321, y = 32056, z = 8, stackpos=1}
	item6 = {x = 33322, y = 32056, z = 8, stackpos=1}
	
if item.actionid == 11000 then
if getTileItemById(item1, heart).uid > 0 then
if getTileItemById(item2, heart).uid > 0 then
if getTileItemById(item3, heart).uid > 0 then
if getTileItemById(item4, heart).uid > 0 then
if getTileItemById(item5, heart).uid > 0 then
if getTileItemById(item6, heart).uid > 0 then
doRemoveItem(getTileItemById(item1, heart).uid,1)
doRemoveItem(getTileItemById(item2, heart).uid,1)
doRemoveItem(getTileItemById(item3, heart).uid,1)
doRemoveItem(getTileItemById(item4, heart).uid,1)
doRemoveItem(getTileItemById(item5, heart).uid,1)
doRemoveItem(getTileItemById(item6, heart).uid,1)
doTeleportThing(cid, pos)
        doSendMagicEffect(getCreaturePosition(cid),10)
        doPlayerSendTextMessage(cid,22,"Good luck!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 6 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 6 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 6 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 6 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 6 burning hearts!")
end
else
doPlayerSendTextMessage(cid, 22, "You need 6 burning hearts!")
end
	return TRUE
end