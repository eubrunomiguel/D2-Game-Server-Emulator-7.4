-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 10110 then
  queststatus = getPlayerStorageValue(cid,10110)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a backpack.")
   bag = doPlayerAddItem(cid, 1988,1)
   doAddContainerItem(bag, 2524, 1)
   doAddContainerItem(bag, 2383, 1)
   doAddContainerItem(bag, 2201, 1)
   doAddContainerItem(bag, 2164, 1)
   doAddContainerItem(bag, 2169, 1)
   doAddContainerItem(bag, 2152, 5)
   setPlayerStorageValue(cid,10110,1)

  else
   doPlayerSendTextMessage(cid,22,"The dead human has already been scanned.")
  end
else
  return 0
end
return 1
end

