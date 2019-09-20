function onStepIn(cid, item, pos)

if getPlayerStorageValue(cid, 50126) == 1 then
doPlayerSendTextMessage(cid, 22, "You already done this quest!")
return false
end

    local i1 = 2337
    local i2 = 2338
    local i3 = 2335
    local i4 = 2336
    local i5 = 2339
    local i6 = 2340
    local i7 = 2341
    local hota = 2342
	item1 = {x=33195, y=32879, z=11, stackpos=1}
	item2 = {x=33196, y=32879, z=11, stackpos=1}
	item3 = {x=33197, y=32879, z=11, stackpos=1}
	item4 = {x=33198, y=32876, z=11, stackpos=1}
	item5 = {x=33200, y=32879, z=11, stackpos=1}
	item6 = {x=33201, y=32879, z=11, stackpos=1}
	item7 = {x=33202, y=32879, z=11, stackpos=1}
	getitem1 = getThingfromPos(item1)
	getitem2 = getThingfromPos(item2)
	getitem3 = getThingfromPos(item3)
	getitem4 = getThingfromPos(item4)
	getitem5 = getThingfromPos(item5)
	getitem6 = getThingfromPos(item6)
	getitem7 = getThingfromPos(item7)
	
if item.actionid == 50126 then
if getTileItemById(item1, i1).uid > 0 then
if getTileItemById(item2, i2).uid > 0 then
if getTileItemById(item3, i3).uid > 0 then
if getTileItemById(item4, i4).uid > 0 then
if getTileItemById(item5, i5).uid > 0 then
if getTileItemById(item6, i6).uid > 0 then
if getTileItemById(item7, i7).uid > 0 then
doRemoveItem(getTileItemById(item1, i1).uid,1)
doRemoveItem(getTileItemById(item2, i2).uid,1)
doRemoveItem(getTileItemById(item3, i3).uid,1)
doRemoveItem(getTileItemById(item4, i4).uid,1)
doRemoveItem(getTileItemById(item5, i5).uid,1)
doRemoveItem(getTileItemById(item6, i6).uid,1)
doRemoveItem(getTileItemById(item7, i7).uid,1)
        doSendMagicEffect(getCreaturePosition(cid),10)
        doPlayerAddItem(cid, hota)
        doPlayerSendTextMessage(cid,22,"You have found a helmet of the ancients.")
        			setPlayerStorageValue(cid,50126,1)

end
else
doPlayerSendTextMessage(cid, 22, "You dont have put the right items on the table!")
end
else
doPlayerSendTextMessage(cid, 22, "You dont have put the right items on the table!")
end
else
doPlayerSendTextMessage(cid, 22, "You dont have put the right items on the table!")
end
else
doPlayerSendTextMessage(cid, 22, "You dont have put the right items on the table!")
end
else
doPlayerSendTextMessage(cid, 22, "You dont have put the right items on the table!")
end
else
doPlayerSendTextMessage(cid, 22, "You dont have put the right items on the table!")
end
else
doPlayerSendTextMessage(cid, 22, "You dont have put the right items on the table!")
end
	return TRUE
end
