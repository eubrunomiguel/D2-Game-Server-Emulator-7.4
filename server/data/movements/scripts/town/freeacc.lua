
function onStepIn(cid, item, pos)


if isPremium(cid) == FALSE then
doSendMagicEffect(pos, 2)
pos = {x=32369, y=32241, z=7}
		doPlayerSetTown(cid, 3)  -- put the town id here
		doPlayerSendTextMessage(cid,22,"You are free account.")
doTeleportThing(cid, pos)
doSendMagicEffect(pos, 13)
else
end
return TRUE
end






