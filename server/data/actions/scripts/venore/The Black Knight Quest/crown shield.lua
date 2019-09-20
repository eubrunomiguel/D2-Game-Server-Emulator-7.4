function onUse(cid, item, frompos, item2, topos)
if item.uid == 4503 then
  queststatus = getPlayerStorageValue(cid,4503)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a crown shield.")
   item_uid = doPlayerAddItem(cid,2519,1)
   setPlayerStorageValue(cid,4503,1)

  else
   doPlayerSendTextMessage(cid,22,"The dead tree is empty.")
  end
else
  return 0
end
return 1
end

