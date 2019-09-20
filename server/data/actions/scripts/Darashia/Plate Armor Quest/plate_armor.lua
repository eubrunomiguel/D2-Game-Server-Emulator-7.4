function onUse(cid, item, frompos, item2, topos)
if item.uid == 10100 then
  queststatus = getPlayerStorageValue(cid,10100)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a plate armor.")
   item_uid = doPlayerAddItem(cid,2463,1)
   setPlayerStorageValue(cid,10100,1)
  else
   doPlayerSendTextMessage(cid,22,"The wooden coffin is empty.")
  end
else
  return 0
end
return 1
end

