-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 9024 then
  queststatus = getPlayerStorageValue(cid,9024)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found boots of haste.")
   item_uid = doPlayerAddItem(cid,2195,1)
   setPlayerStorageValue(cid,9024,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

