function onUse(cid, item, frompos, item2, topos)
if item.uid == 3007 then
  queststatus = getPlayerStorageValue(cid,3007)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a combat knife.")
   item_uid = doPlayerAddItem(cid,2404,1)
   setPlayerStorageValue(cid,3007,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

