-- Script by Rodrigo (Nottinghster)
local liquidContainers = {1786, 1788, 1790, 1792}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 2693 and isInArray(liquidContainers, itemEx.itemid) == TRUE then
		doChangeTypeItem(item.uid, item.type - 1)
		doPlayerAddItem(cid, 2689, 1)
	else
		return FALSE
	end
	return TRUE
end