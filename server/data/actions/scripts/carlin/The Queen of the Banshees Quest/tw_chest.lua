-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 9020 then
  queststatus = getPlayerStorageValue(cid,9020)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found tower shield.")
   item_uid = doPlayerAddItem(cid,2528,1)
   setPlayerStorageValue(cid,9020,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

