-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 10016 then
  queststatus = getPlayerStorageValue(cid,10016)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a golden armor.")
   doPlayerAddItem(cid, 2466, 1)
   setPlayerStorageValue(cid,10016,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

