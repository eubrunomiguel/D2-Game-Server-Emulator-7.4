function onUse(cid, item, frompos, item2, topos)
if item.uid == 3006 then
  queststatus = getPlayerStorageValue(cid,3006)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a letter.")
   item_uid = doPlayerAddItem(cid,2597,2)
   setPlayerStorageValue(cid,3006,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

