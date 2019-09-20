function onUse(cid, item, frompos, item2, topos)
if item.uid == 3024 then
  queststatus = getPlayerStorageValue(cid,3024)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a a honey flower.")
   item_uid = doPlayerAddItem(cid,2103,1)
   setPlayerStorageValue(cid,3024,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

