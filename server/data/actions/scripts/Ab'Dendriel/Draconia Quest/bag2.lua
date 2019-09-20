function onUse(cid, item, frompos, item2, topos)
if item.uid == 9510 then
  queststatus = getPlayerStorageValue(cid,9510)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a bag.")
   bag = doPlayerAddItem(cid,1987,1)
   doAddContainerItem(bag,2197,1)
   doAddContainerItem(bag,2167,1)
   setPlayerStorageValue(cid,9510,1)
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

