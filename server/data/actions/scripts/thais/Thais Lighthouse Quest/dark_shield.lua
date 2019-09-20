function onUse(cid, item, frompos, item2, topos)
if item.uid == 4018 then
  queststatus = getPlayerStorageValue(cid,4018)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a dark shield.")
   doPlayerAddItem(cid, 2521, 1)
   setPlayerStorageValue(cid,4018,1)
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

