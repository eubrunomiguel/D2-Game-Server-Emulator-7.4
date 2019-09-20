function onStepIn(cid, item, pos)


if isPremium(cid) == FALSE then
doPlayerSendCancel(cid,"Only premium players can enter.")
doSendMagicEffect(pos, 2)
pos.y = pos.y+2
doTeleportThing(cid, pos)
doSendMagicEffect(pos, 13)
else
end
return TRUE
end
