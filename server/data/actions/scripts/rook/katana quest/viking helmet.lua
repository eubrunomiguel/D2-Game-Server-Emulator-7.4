function onUse(cid, item, frompos, item2, topos)
if item.uid == 3016 then
  queststatus = getPlayerStorageValue(cid,3016)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a viking helmet.")
   item_uid = doPlayerAddItem(cid,2473,1)
   setPlayerStorageValue(cid,3016,1)

  else
   doPlayerSendTextMessage(cid,22,"The dead human body is empty.")
  end
else
  return 0
end
return 1
end

