function onUse(cid, item, frompos, item2, topos)
if item.uid == 4012 then
  queststatus = getPlayerStorageValue(cid,4012)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a noble armor.")
   item_uid = doPlayerAddItem(cid,2486,1)
   setPlayerStorageValue(cid,4012,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

