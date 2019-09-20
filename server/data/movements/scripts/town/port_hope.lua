--Example change voc and masterpos--

function onStepIn(cid, item, pos)
	if item.actionid==50109 then
		newpos = {x=32595, y=32745, z=7}
		doPlayerSetTown(cid, 8)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Port Hope.")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end