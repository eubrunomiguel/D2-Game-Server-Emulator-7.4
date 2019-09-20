function onStepIn(cid, item, pos)


if isPremium(cid) == FALSE then
doPlayerSendCancel(cid,"Only premium players can enter.")
doSendMagicEffect(pos, 2)
pos.x = pos.x-1
doTeleportThing(cid, pos)
doSendMagicEffect(pos, 13)
else
end
return TRUE
end
