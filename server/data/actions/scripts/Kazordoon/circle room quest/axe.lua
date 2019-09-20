function onUse(cid, item, frompos, item2, topos)
if item.uid == 8017 then
  queststatus = getPlayerStorageValue(cid,8017)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a dwarven axe.")
   item_uid = doPlayerAddItem(cid,2435,1)
   setPlayerStorageValue(cid,8017,1)
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

