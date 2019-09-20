--Example change voc and masterpos--

function onStepIn(cid, item, pos)
	if item.actionid==50107 then
		newpos = {x=33213, y=32454, z=1}
		doPlayerSetTown(cid, 7)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Darashia.")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end