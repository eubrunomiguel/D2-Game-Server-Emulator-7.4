function onUse(cid, item, frompos, item2, topos)
if item.uid == 3021 then
  queststatus = getPlayerStorageValue(cid,3021)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a fishing rod.")
   item_uid = doPlayerAddItem(cid,2580,1)
   setPlayerStorageValue(cid,3021,1)

  else
   doPlayerSendTextMessage(cid,22,"It\'s empty.")
  end
else
  return 0
end
return 1
end


