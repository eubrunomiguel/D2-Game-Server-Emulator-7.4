-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 5002 then
  queststatus = getPlayerStorageValue(cid,5002)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a dwarven armor.")
   doPlayerAddItem(cid, 2503, 1)
   setPlayerStorageValue(cid,5002,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

