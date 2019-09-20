function onStepIn(cid, item, pos)
	if item.actionid==51011 then
		newpos = {x = 32098, y = 32116, z = 7}
		doPlayerSetTown(cid, 11)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Rookgaard.")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end