--Example change voc and masterpos--

function onStepIn(cid, item, pos)
	if item.actionid==50104 then
		newpos = {x=32649, y=31925, z=11}
		doPlayerSetTown(cid, 2)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Kazordoon")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end