-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 10004 then
  queststatus = getPlayerStorageValue(cid,10004)
  if queststatus == -1 then
   doPlayerSendTextMessage(cid,22,"You have found a demon shield.")
   item_uid = doPlayerAddItem(cid,2520,1)
   setPlayerStorageValue(cid,10004,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

