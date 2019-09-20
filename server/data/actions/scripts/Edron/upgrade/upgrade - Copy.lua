function onUse(cid, item, frompos, item2, topos)
if topos.x == 65535 or not (topos.x == 33314 and topos.y == 31683 and topos.z == 11)then
doPlayerSendCancel(cid, 'Put the metal on the anvil first.')
return TRUE
end



if item2.itemid == 2258 then
doTransformItem(item2.uid, 2157)
doSendMagicEffect(topos, 3)
end
if item2.itemid == 2123 then
if doPlayerRemoveMoney(cid,100000) then
doTransformItem(item2.uid, 2357)
doSendMagicEffect(topos, 3)
else
doPlayerSendCancel(cid, 'not enough cash.')
end
end
if item2.itemid == 2519 then
if getPlayerItemCount(cid,2157) >= 100 then
doPlayerRemoveItem(cid,2157,100)
doTransformItem(item2.uid, 2539)
doSendMagicEffect(topos, 3)
else
doPlayerSendCancel(cid, 'Keep nuggets in your backpack.')
end
end


















return TRUE
end

