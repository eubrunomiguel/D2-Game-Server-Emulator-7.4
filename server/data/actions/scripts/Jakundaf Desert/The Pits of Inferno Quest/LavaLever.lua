function onUse(cid, item, frompos, item2, topos)

tile1pos = {x=592, y=1419, z=14, stackpos=0}
tile1 = getThingfromPos(tile1pos)
tile2pos = {x=593, y=1419, z=14, stackpos=0}
tile2 = getThingfromPos(tile2pos)
tile3pos = {x=592, y=1418, z=14, stackpos=0}
tile3 = getThingfromPos(tile3pos)
tile4pos = {x=593, y=1418, z=14, stackpos=0}
tile4 = getThingfromPos(tile4pos)

local WalkAble = 407
local UnWalkAble = 599


if (item.uid == 10285 and item.itemid == 1945 and tile1.itemid == UnWalkAble and tile2.itemid == UnWalkAble and tile3.itemid == UnWalkAble and tile4.itemid == UnWalkAble) then

doTransformItem(tile1.uid,WalkAble)
doTransformItem(tile2.uid,WalkAble)
doTransformItem(tile3.uid,WalkAble)
doTransformItem(tile4.uid,WalkAble)

doTransformItem(item.uid,1946)

elseif (item.uid == 10285 and item.itemid == 1946 and tile1.itemid == WalkAble and tile2.itemid == WalkAble and tile3.itemid == WalkAble and tile4.itemid == WalkAble) then

doTransformItem(tile1.uid,UnWalkAble)
doTransformItem(tile2.uid,UnWalkAble)
doTransformItem(tile3.uid,UnWalkAble)
doTransformItem(tile4.uid,UnWalkAble)
doTransformItem(item.uid,1945)
else 
doPlayerSendCancel(cid,"Sorry, not possible.") 
end 
end