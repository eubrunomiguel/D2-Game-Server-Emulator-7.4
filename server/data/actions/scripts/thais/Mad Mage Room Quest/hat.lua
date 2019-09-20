function onUse(cid, item, frompos, item2, topos)
if item.uid == 4007 then
  queststatus = getPlayerStorageValue(cid,4007)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a magician hat.")
   doPlayerAddItem(cid,2662,1)
   setPlayerStorageValue(cid,4007,1)
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

