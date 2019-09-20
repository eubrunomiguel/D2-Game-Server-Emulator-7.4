-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 10008 then
  queststatus = getPlayerStorageValue(cid,10008)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a fire axe.")
   bag = doPlayerAddItem(cid, 1987, 1)
   doAddContainerItem(bag, 2214, 1)
   doAddContainerItem(bag, 2201, 1)
   doAddContainerItem(bag, 2145, 7)
   doPlayerAddItem(cid, 2432, 1)
   setPlayerStorageValue(cid,10008,1)

  else
   doPlayerSendTextMessage(cid,22,"The corpse is empty.")
  end
else
  return 0
end
return 1
end

