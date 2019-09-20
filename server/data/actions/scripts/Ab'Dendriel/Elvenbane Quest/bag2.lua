function onUse(cid, item, frompos, item2, topos)
if item.uid == 9501 then
  queststatus = getPlayerStorageValue(cid,9501)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a bag.")
   bag = doPlayerAddItem(cid,1987,1)
   doAddContainerItem(bag,2006,7)
   doAddContainerItem(bag,2260,1)
   setPlayerStorageValue(cid,9501,1)
  else
   doPlayerSendTextMessage(cid,22,"The small drawer is empty.")
  end
else
  return 0
end
return 1
end

