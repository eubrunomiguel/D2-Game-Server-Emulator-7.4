function onUse(cid, item, fromPosition, itemEx, toPosition)
local liquidContainers = {1775, 2005}
local ovens = {1786, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 6356, 6357, 6358, 6359, 6360, 6361, 6362, 6363}
local lumpsOfChocolateDough = getPlayerItemCount(cid, 6277) + getPlayerItemCount(cid, 6574)
if item.itemid == 2692 and isInArray(liquidContainers, itemEx.itemid) == TRUE and itemEx.type == 1 then
doChangeTypeItem(item.uid, item.type - 1)
doPlayerAddItem(cid, 2693, 1)
doChangeTypeItem(itemEx.uid, item.type - item.type)
elseif item.itemid == 2694 and (itemEx.itemid == 1381 or itemEx.itemid == 1382 or itemEx.itemid == 1383 or itemEx.itemid == 1384) then
doChangeTypeItem(item.uid, item.type - 1)
doPlayerAddItem(cid, 2692, 1)
elseif item.itemid == 2693 and isInArray(ovens, itemEx.itemid) == TRUE then
doChangeTypeItem(item.uid, item.type - 1)
doCreateItem(2689, 1, toPosition)
elseif item.itemid == 2692 and isInArray(liquidContainers, itemEx.itemid) == TRUE and itemEx.type == 6 then
doChangeTypeItem(item.uid, item.type - 1)
doPlayerAddItem(cid, 6277, 1)
doChangeTypeItem(itemEx.uid, itemEx.type - itemEx.type)
elseif item.itemid == 6277 and isInArray(ovens, itemEx.itemid) == TRUE then
doChangeTypeItem(item.uid, item.type - 1)
doCreateItem(6278, 1, toPosition)
elseif item.itemid == 2566 and (itemEx.itemid == 2679 or itemEx.itemid == 2680 or itemEx.itemid == 2674) and getPlayerItemCount(cid, 6278) > 0 then
doRemoveItem(itemEx.uid, 1)
doPlayerRemoveItem(cid, 6278, 1)
doPlayerAddItem(cid, 6279, 1)
elseif item.itemid == 6277 and itemEx.itemid == 2561 then
doRemoveItem(item.uid, 1)
doTransformItem(itemEx.uid, 8848)
elseif item.itemid == 8848 and isInArray(ovens, itemEx.itemid) == TRUE then
doTransformItem(item.uid, 2561)
doCreateItem(2687, 12, toPosition)
elseif item.itemid == 5865 and (itemEx.itemid == 2679 or itemEx.itemid == 2680 or itemEx.itemid == 2674) and getPlayerItemCount(cid, 2006) > 0 then
doRemoveItem(itemEx.uid, 1)
doPlayerRemoveItem(cid, 2006, 1)
doPlayerAddItem(cid, 2006, 21)	
elseif item.itemid == 6277 and itemEx.itemid == 6574 then
doRemoveItem(itemEx.uid, 1)
doChangeTypeItem(item.uid, item.type - 1)
if (getPlayerItemCount(cid, 6277) + getPlayerItemCount(cid, 6574)) ~= lumpsOfChocolateDough then
doPlayerAddItem(cid, 8846, 1)
else
doCreateItem(8846, 1, toPosition)
end
elseif item.itemid == 8846 and isInArray(ovens, itemEx.itemid) == TRUE then
doChangeTypeItem(item.uid, item.type - 1)
doCreateItem(8847, 1, toPosition)	
else
return FALSE
end
return TRUE
end