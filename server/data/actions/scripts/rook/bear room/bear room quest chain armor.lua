function onUse(cid, item, frompos, item2, topos)
if item.uid == 3000 then
  queststatus = getPlayerStorageValue(cid,3000)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a chain armor.")
   item_uid = doPlayerAddItem(cid,2464,1)
   setPlayerStorageValue(cid,3000,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

