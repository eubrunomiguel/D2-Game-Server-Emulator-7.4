function onUse(cid, item, frompos, item2, topos)
if item.uid == 2999 then
  queststatus = getPlayerStorageValue(cid,2999)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a key.")
   item_uid = doPlayerAddItem(cid,2088,1)
   doSetItemActionId(item_uid,14001)
   setPlayerStorageValue(cid,2999,1)
  else
   doPlayerSendTextMessage(cid,22,"its  empty.")
  end
else
  return 0
end
return 1
end

