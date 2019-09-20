--Script by Nottinghster
function onStepIn(cid, item, pos)

	coin = {x = 33161, y = 32831, z = 10, stackpos=1}
	newpos = {x = 33156, y = 32832, z = 10}

	getcoin = getThingfromPos(coin)
	
	if item.actionid == 60069 and getcoin.itemid == 2159 then
		doTeleportThing(cid,newpos)
		doRemoveItem(getcoin.uid,1)
		doSendMagicEffect(coin, 15)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		else
	end
	
	if item.actionid == 60070 then
	doTeleportThing(cid, {x = 33161, y = 32832, z = 10})
	doSendMagicEffect(getCreaturePosition(cid), 10)	
	end
	return TRUE
end