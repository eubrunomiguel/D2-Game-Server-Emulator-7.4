function onUse(cid, item, frompos, item2, topos)
if item.uid == 9509 then
  queststatus = getPlayerStorageValue(cid,9509)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a bag.")
   bag = doPlayerAddItem(cid,1987,1)
   doAddContainerItem(bag,2396,1)
   doAddContainerItem(bag,2409,1)
   setPlayerStorageValue(cid,9509,1)
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

