function onUse(cid,item,frompos,item2,topos)
	if(item.itemid == 2177) then
	doRemoveItem(item.uid, 100)
	doPlayerAddItem(cid,2168,1)
	end
end
