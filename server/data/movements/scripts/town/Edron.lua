--Example change voc and masterpos--

function onStepIn(cid, item, pos)
	if item.actionid==50106 then
		newpos = {x=33217, y=31814, z=8}
		doPlayerSetTown(cid, 9)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Edron.")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end