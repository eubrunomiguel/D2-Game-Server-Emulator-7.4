function onUse(cid, item, frompos, item2, topos)
if item.uid == 9505 then
  queststatus = getPlayerStorageValue(cid,9505)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a knight armor.")
   item_uid = doPlayerAddItem(cid,2476,1)
   setPlayerStorageValue(cid,9505,1)
  else
   doPlayerSendTextMessage(cid,22,"The box is empty.")
  end
else
  return FALSE
end
return TRUE
end

