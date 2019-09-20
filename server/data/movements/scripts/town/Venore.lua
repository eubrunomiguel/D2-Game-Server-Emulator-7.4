--Example change voc and masterpos--

function onStepIn(cid, item, pos)
	if item.actionid==50105 then
		newpos = {x=32957, y=32076, z=7}
		doPlayerSetTown(cid, 4)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Venore.")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end