--Script by Nottinghster
function onStepIn(cid, item, pos)

	coin = {x=33135, y=32682, z=12, stackpos=1}
	newpos = {x=33130, y=32683, z=12}

	getcoin = getThingfromPos(coin)
	
	if item.actionid == 50118 and getcoin.itemid == 2159 then
		doTeleportThing(cid,newpos)
		doRemoveItem(getcoin.uid,1)
		doSendMagicEffect(coin, 15)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		else
	end
	
	if item.actionid == 50119 then
	doTeleportThing(cid, {x=33136, y=32683, z=12})
	doSendMagicEffect(getCreaturePosition(cid), 10)	
	end
	return TRUE
end