--Example change voc and masterpos--

function onStepIn(cid, item, pos)
	if item.actionid==50101 then
		newpos = {x=32369, y=32241, z=7}
		doPlayerSetTown(cid, 3)
		doPlayerSendTextMessage(cid,22,"You have changed your residence to Thais")
		doTeleportThing(cid,newpos)
		doSendMagicEffect(newpos,12)
		return 1
	end
end