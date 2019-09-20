function onUse(cid, item, frompos, item2, topos)
if item.uid == 3017 then
  queststatus = getPlayerStorageValue(cid,3017)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a katana sword.")
   item_uid = doPlayerAddItem(cid,2412,1)
   setPlayerStorageValue(cid,3017,1)

  else
   doPlayerSendTextMessage(cid,22,"The dead human body is empty.")
  end
else
  return 0
end
return 1
end

