function onUse(cid, item, frompos, item2, topos)
if item.uid == 4002 then
  queststatus = getPlayerStorageValue(cid,4002)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found an elven amulet.")
   item_uid = doPlayerAddItem(cid,2198,1)
   setPlayerStorageValue(cid,4002,1)

  else
   doPlayerSendTextMessage(cid,22,"The dead human is empty.")
  end
else
  return 0
end
return 1
end

