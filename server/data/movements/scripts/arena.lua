function onStepIn(cid, item, pos, fromPosition)
if getPlayerStorageValue(cid, 7000) == -1 then
doPlayerSendCancel(cid,"You need to finish Warlord Quest to enter.")
pos.y = pos.y+1
         doTeleportThing(cid, fromPosition)
         doSendMagicEffect(getCreaturePosition(cid), 2)
end
return TRUE
end

