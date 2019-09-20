function onUse(cid, item, frompos, item2, topos)
    
	if item2.itemid == 2739 then
		doTransformItem(item2.uid,2737)
		doDecayItem(item2.uid)
		doCreateItem(2694,1,topos)
	elseif item2.itemid == 5471 then
		doTransformItem(item2.uid,5463)
		doDecayItem(item2.uid)
		doCreateItem(5467,1,topos)
	elseif item2.itemid == 2782 then
		doTransformItem(item2.uid,2781)
		doDecayItem(item2.uid)
	elseif item2.itemid == 3799 then
		doRemoveItem(item2.uid,1)
		doDecayItem(item2.uid)
	elseif item2.itemid == 3798 then
		doRemoveItem(item2.uid,1)
		doDecayItem(item2.uid)
	elseif item2.itemid == 1499 then
		doRemoveItem(item2.uid,1)
		doDecayItem(item2.uid)		
	else 
		return 0
	end
	return 1
end