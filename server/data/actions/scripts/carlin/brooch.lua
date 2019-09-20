-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 9025 then
  queststatus = getPlayerStorageValue(cid,9025)
  if queststatus == -1 then
   doPlayerSendTextMessage(cid,22,"You have found a family brooch.")
   item_uid = doPlayerAddItem(cid,2318,1)
   setPlayerStorageValue(cid,9025,1)

  else
   doPlayerSendTextMessage(cid,22,"The coffin is empty.")
  end
else
  return 0
end
return 1
end

