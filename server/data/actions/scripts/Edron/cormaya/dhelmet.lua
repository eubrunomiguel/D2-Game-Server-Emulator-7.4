-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 5000 then
  queststatus = getPlayerStorageValue(cid,5000)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then

if getPlayerFreeCap(cid) > 222 then
   doPlayerSendTextMessage(cid,22,"You have found a dwarven set.")
        local bag = doPlayerAddItem(cid,1987,1)
        doAddContainerItem(bag,2502,1)
        doAddContainerItem(bag,2503,1)
        doAddContainerItem(bag,2504,1)
   setPlayerStorageValue(cid,5000,1)
else
   doPlayerSendTextMessage(cid,22,"You do not have enough cap (222 oz).")
end
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

