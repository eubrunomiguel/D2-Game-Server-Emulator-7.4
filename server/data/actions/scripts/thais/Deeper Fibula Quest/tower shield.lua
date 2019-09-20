function onUse(cid, item, frompos, item2, topos)
if item.uid == 4004 then
  queststatus = getPlayerStorageValue(cid,4004)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a tower shield.")
   item_uid = doPlayerAddItem(cid,2528,1)
   setPlayerStorageValue(cid,4004,1)

  else
   doPlayerSendTextMessage(cid,22,"The dead skeleton is empty.")
  end
else
  return 0
end
return 1
end

