-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 10005 then
  queststatus = getPlayerStorageValue(cid,10005)
  if queststatus == -1 then
   doPlayerSendTextMessage(cid,22,"You have found a steel boots.")
   item_uid = doPlayerAddItem(cid,2645,1)
   setPlayerStorageValue(cid,10005,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

