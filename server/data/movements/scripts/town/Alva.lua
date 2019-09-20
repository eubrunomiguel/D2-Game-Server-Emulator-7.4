--Example change voc and masterpos--

function onStepIn(cid, item, pos)
	if item.actionid==5666 then
		newpos = {x = 33330, y = 32061, z = 7}
		doPlayerSetTown(cid, 12)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Alva")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end