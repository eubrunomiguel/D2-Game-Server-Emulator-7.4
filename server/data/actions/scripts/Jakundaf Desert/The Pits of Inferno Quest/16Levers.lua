function onUse(cid, item, frompos, item2, topos)
local wall1pos = {x=458, y=1386, z=11, stackpos=1}
local wall2pos = {x=459, y=1386, z=11, stackpos=1}
local leverpos1 = {x=450, y=1412, z=11, stackpos=1}
local leverpos2 = {x=454, y=1385, z=12,	 stackpos=1}
local leverpos3 = {x=493, y=1390, z=12, stackpos=1}
local leverpos4 = {x=460, y=1412, z=13, stackpos=1}
local leverpos5 = {x=457, y=1419, z=12, stackpos=1}
local leverpos6 = {x=467, y=1417, z=12, stackpos=1}
local leverpos7 = {x=481, y=1407, z=13, stackpos=1}
local leverpos8 = {x=481, y=1387, z=11, stackpos=1}
local leverpos9 = {x=498, y=1381, z=13, stackpos=1}
local leverpos10 = {x=450, y=1405, z=13, stackpos=1}
local leverpos11 = {x=496, y=1402, z=14, stackpos=1}
local leverpos12 = {x=494, y=1383, z=11, stackpos=1}
local leverpos13 = {x=453, y=1371, z=11, stackpos=1}
local leverpos14 = {x=494, y=1408, z=12, stackpos=1}

local wall1 = getThingfromPos(wall1pos)
local wall2 = getThingfromPos(wall2pos)
local lever1 = getThingfromPos(leverpos1)
local lever2 = getThingfromPos(leverpos2)
local lever3 = getThingfromPos(leverpos3)
local lever4 = getThingfromPos(leverpos4)
local lever5 = getThingfromPos(leverpos5)
local lever6 = getThingfromPos(leverpos6)
local lever7 = getThingfromPos(leverpos7)
local lever8 = getThingfromPos(leverpos8)
local lever9 = getThingfromPos(leverpos9)
local lever10 = getThingfromPos(leverpos10)
local lever11 = getThingfromPos(leverpos11)
local lever12 = getThingfromPos(leverpos12)
local lever13 = getThingfromPos(leverpos13)
local lever14 = getThingfromPos(leverpos14)

if item.uid == 10284 and item.itemid == 1945 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and lever6.itemid == 1946 and lever7.itemid == 1946 and lever8.itemid == 1946 and lever9.itemid == 1946 and lever10.itemid == 1946 and lever11.itemid == 1946 and lever12.itemid == 1946 and lever13.itemid == 1946 and lever14.itemid == 1946 and wall1.itemid == 1304 then
doSendMagicEffect(wall1pos, 2)
doSendMagicEffect(wall2pos, 2)
doRemoveItem(wall1.uid,1)
doRemoveItem(wall2.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 10284 and item.itemid == 1946 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and lever6.itemid == 1946 and lever7.itemid == 1946 and lever8.itemid == 1946 and lever9.itemid == 1946 and lever10.itemid == 1946 and lever11.itemid == 1946 and lever12.itemid == 1946 and lever13.itemid == 1946 and lever14.itemid == 1946 and wall1.itemid == 0 then
doSendMagicEffect(wall1pos, 13)
doSendMagicEffect(wall2pos, 13)
doCreateItem(1304,1,wall1pos)
doCreateItem(1304,1,wall2pos)
doTransformItem(item.uid,item.itemid-1)
else
 doPlayerSendCancel(cid,"You need to flip all 15 levers.")
end
return TRUE
end