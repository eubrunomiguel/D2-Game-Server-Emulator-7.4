function onUse(cid, item, frompos, item2, topos)
if item.uid == 3018 then
  queststatus = getPlayerStorageValue(cid,3018)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a key.")
   item_uid = doPlayerAddItem(cid,2088,1)
   doSetItemActionId(item_uid,14000)
   setPlayerStorageValue(cid,3018,1)
  else
   doPlayerSendTextMessage(cid,22,"The slain skeleton is empty.")
  end
else
  return 0
end
return 1
end

